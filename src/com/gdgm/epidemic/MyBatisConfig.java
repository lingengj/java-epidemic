package com.gdgm.epidemic;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import javax.sql.DataSource;

@Configuration
@MapperScan(basePackages = "com.gdgm.epidemic.mapper")
public class MyBatisConfig {

    private static Logger logger = Logger.getLogger(MyBatisConfig.class);

    //配置数据源
    @Bean(name = "dataSource",destroyMethod = "close")
    public BasicDataSource basicDataSource(){
        BasicDataSource dataSource = new BasicDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://127.0.0.1:3306/epidemic");
        dataSource.setUsername("root");
        dataSource.setPassword("");
        dataSource.setInitialSize(3);
        dataSource.setMaxActive(50);
        dataSource.setMaxIdle(1);
        dataSource.setMaxWait(4000);
        dataSource.setDefaultAutoCommit(false);
        return dataSource;
    }

    @Bean
    public SqlSessionFactory sessionFactory(DataSource dataSource){
        SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
        SqlSessionFactory factory = null;
        //设置要使用的数据源
        factoryBean.setDataSource(dataSource);
        //设置xml文件中的类所在的包
        factoryBean.setTypeAliasesPackage("com.gdgm.epidemic.beans");
        //将从数据库查找到的下划线分隔的属性名转化为驼峰表示的属性名
        org.apache.ibatis.session.Configuration configuration = new org.apache.ibatis.session.Configuration();
        configuration.setMapUnderscoreToCamelCase(true);
        factoryBean.setConfiguration(configuration);
        try {
            //设置映射xml文件的路径
            Resource[] resources = new PathMatchingResourcePatternResolver().getResources("classpath:com/gdgm/epidemic/mapper/*Mapper.xml");
            factoryBean.setMapperLocations(resources);
            factory = factoryBean.getObject();
        } catch (Exception e) {
            logger.error("解析映射xml文件时异常"+e.getMessage());
        }
        return factory;
    }

}
