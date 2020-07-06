package com.gdgm.epidemic;

import com.gdgm.epidemic.common.DateConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.format.FormatterRegistry;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.config.annotation.*;


@Configuration
@EnableWebMvc
@ComponentScan(includeFilters = @ComponentScan.Filter(type = FilterType.ANNOTATION,classes = Controller.class))
public class SpringMVCConfig extends WebMvcConfigurerAdapter {

    @Autowired
    private DateConverter dateConverter;
    //添加视图控制器
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/").setViewName("epidemic");
    }

    //配置视图解析器
    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        //定义了一个内部资源视图解析器(InternalResourceViewResolver)
        registry.jsp("/",".jsp");
    }

    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addConverter(dateConverter);
    }

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }
}
