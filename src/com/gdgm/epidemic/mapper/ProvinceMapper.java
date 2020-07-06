package com.gdgm.epidemic.mapper;

import com.gdgm.epidemic.beans.ProvinceInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface ProvinceMapper {

    @Select(value = "SELECT p.`province_id`,p.`province_name`,p.`province_py` " +
            "FROM provinces p " +
            "WHERE (p.`del_flag` IS NULL OR  p.`del_flag`=0) " +
            "AND p.`province_id` NOT IN ( " +
            "SELECT e.`province_id` " +
            "FROM epidemics e " +
            "WHERE e.`data_year`=#{arg0} AND e.`data_month`=#{arg1} AND e.`data_day`=#{arg2} " +
            "  ) ORDER BY p.`province_id` " +
            "LIMIT 0,6")
    List<ProvinceInfo> findNoDataProvinces(short year, short month, short day);
}
