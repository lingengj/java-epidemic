package com.gdgm.epidemic.service.impl;

import com.gdgm.epidemic.beans.DailyEpidemicInfo;
import com.gdgm.epidemic.beans.EpidemicDetailInfo;
import com.gdgm.epidemic.beans.EpidemicInfo;
import com.gdgm.epidemic.beans.ProvinceInfo;
import com.gdgm.epidemic.mapper.EpidemicMapper;
import com.gdgm.epidemic.mapper.ProvinceMapper;
import com.gdgm.epidemic.service.EpidemicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class EpidemicServiceImpl implements EpidemicService {

    @Autowired
    private EpidemicMapper epidemicMapper;
    @Autowired
    private ProvinceMapper provinceMapper;

    @Override
    public List<ProvinceInfo> saveData(DailyEpidemicInfo dailyEpidemicInfo, Integer userId) {
        Date current = new Date();
        //数据的日期
        String[] ymd = dailyEpidemicInfo.getDate().split("-");
        short year = 0, month = 0, day = 0;
        year = Short.parseShort(ymd[0]);
        month = Short.parseShort(ymd[1]);
        day = Short.parseShort(ymd[2]);
        for (EpidemicInfo epidemicInfo : dailyEpidemicInfo.getArray()) {
            //设置录入该数据的用户编号
            epidemicInfo.setUserId(userId);
            //设置数据的录入日期
            epidemicInfo.setInputDate(current);
            //设置数据对应的日期
            epidemicInfo.setDataYear(year);
            epidemicInfo.setDataMonth(month);
            epidemicInfo.setDataDay(day);
            this.epidemicMapper.saveInfo(epidemicInfo);
        }
        return this.provinceMapper.findNoDataProvinces(year, month, day);
    }

    @Override
    public List<EpidemicDetailInfo> findLastestData() {
        //查询每个省份的累计数量和当日新增数量
        Calendar calendar = new GregorianCalendar();
        short year = 0, month = 0, day = 0;
        year = (short) calendar.get(Calendar.YEAR);
        month = (short) (calendar.get(Calendar.MONTH) + 1);
        day = (short) calendar.get(Calendar.DATE);

        Map<String, Short> condition = new HashMap<>();
        condition.put("year", year);
        condition.put("month", month);
        condition.put("day", day);
        //查询每个省份的累计数量和当日新增数量
        List<EpidemicDetailInfo> list = this.epidemicMapper.findLastestData(condition);
        return list;
    }
}
