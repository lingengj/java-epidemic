package com.gdgm.epidemic.common;

import org.apache.log4j.Logger;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Component
public class DateConverter implements Converter<String, Date> {

    private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    public static Logger logger = Logger.getLogger(DateConverter.class);

    @Override
    public Date convert(String s) {
        if(s == null||s.length() == 0)
            return null;
        Date date = null;
        try {
            date = dateFormat.parse(s);
        } catch (ParseException e) {
            logger.error("转换提交的参数"+s+"为日期时出错"+e.getMessage());
        }
        return date;
    }
}
