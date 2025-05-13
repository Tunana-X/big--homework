package com.soft.common.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {

    /**
     * 给指定日期增加天数
     * @param date 原始日期
     * @param days 增加的天数（可为负数）
     * @return 新日期
     */
    public static Date addDays(Date date, int days) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.DATE, days);
        return cal.getTime();
    }
    public static Date parseDate(String dateStr) throws Exception {
        if (dateStr == null || dateStr.isEmpty()) {
            return new Date(); // 默认当前日期
        }
        return new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);
    }
    /**
     * 将日期格式化为字符串
     */
    public static String dateToDateString(Date date, String pattern) {
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(pattern);
        return sdf.format(date);
    }

    /**
     * 解析日期字符串
     */
    public static Date parse(String dateStr) {
        try {
            return new java.text.SimpleDateFormat("yyyy-MM-dd").parse(dateStr);
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 获取当前日期
     */
    public static String getCurDate() {
        return dateToDateString(new Date(), "yyyy-MM-dd");
    }

    /**
     * 获取当前日期时间
     */
    public static String getCurDateTime() {
        return dateToDateString(new Date(), "yyyy-MM-dd HH:mm:ss");
    }
}