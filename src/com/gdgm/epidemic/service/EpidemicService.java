package com.gdgm.epidemic.service;

import com.gdgm.epidemic.beans.DailyEpidemicInfo;
import com.gdgm.epidemic.beans.EpidemicDetailInfo;
import com.gdgm.epidemic.beans.ProvinceInfo;

import java.util.List;

public interface EpidemicService {
    /**
     * 保存当日的疫情数据，返回还未录入数据的省份列表
     *
     * @param dailyEpidemicInfo
     * @return
     */
    List<ProvinceInfo> saveData(DailyEpidemicInfo dailyEpidemicInfo, Integer userId);

    /**
     * 获取最新疫情数据
     *
     * @return
     */
    List<EpidemicDetailInfo> findLastestData();
}
