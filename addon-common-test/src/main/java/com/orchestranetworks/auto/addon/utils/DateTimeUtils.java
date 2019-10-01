package com.orchestranetworks.auto.addon.utils;

import java.text.*;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

public class DateTimeUtils {

    public static String getNextDate(String string) {
        final SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
        Calendar calendar = null;
        Date date;
        try {
            date = format.parse(string);
            calendar = Calendar.getInstance();
            calendar.setTime(date);
            calendar.add(Calendar.DAY_OF_YEAR, 1);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return format.format(calendar.getTime());
    }

    public static String getCurrentDateTime() {
        Calendar localCalendar = Calendar.getInstance(TimeZone.getDefault());
        NumberFormat formatter = new DecimalFormat("00");
        Date currentTime = localCalendar.getTime();
        int currentDay = localCalendar.get(Calendar.DATE);
        int currentMonth = localCalendar.get(Calendar.MONTH) + 1;
        int currentYear = localCalendar.get(Calendar.YEAR);

        String datevalue = formatter.format(currentMonth) + "/" + formatter.format(currentDay) + "/" + currentYear;
        return datevalue;
    }

    public static int getCurrentDay() {
        Calendar localCalendar = Calendar.getInstance(TimeZone.getDefault());
        int currentDay = localCalendar.get(Calendar.DATE);
        return currentDay;
    }

    public static int getCurrentMonth() {
        Calendar localCalendar = Calendar.getInstance(TimeZone.getDefault());
        int currentMonth = localCalendar.get(Calendar.MONTH) + 1;
        return currentMonth;
    }

    public static int getNextMonth() {
        Calendar localCalendar = Calendar.getInstance(TimeZone.getDefault());
        localCalendar.add(Calendar.MONTH, 1);
        int nextMonth = localCalendar.get(Calendar.MONTH);
        return nextMonth;
    }

    public static int getCurrentYear() {
        Calendar localCalendar = Calendar.getInstance(TimeZone.getDefault());
        int currentYear = localCalendar.get(Calendar.YEAR);
        return currentYear;
    }

    public static String getToday() {
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        Calendar cal = Calendar.getInstance();
        return dateFormat.format(cal.getTime());
    }

    /**
     * Get time based on parameter format
     *
     * @param stringFormat desired string format
     * @author Levin
     */
    public static String getTime(String stringFormat) {
        DateFormat dateFormat = new SimpleDateFormat(stringFormat);
        Calendar cal = Calendar.getInstance();
        return dateFormat.format(cal.getTime());
    }


}
