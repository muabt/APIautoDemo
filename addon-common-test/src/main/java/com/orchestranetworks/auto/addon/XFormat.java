package com.orchestranetworks.auto.addon;

import java.text.SimpleDateFormat;

public class XFormat {

	public static String of(String xPath, String value) {

		return String.format(xPath, value);

	}

	public static String of(String xPath, String... values) {
		return String.format(xPath, values);

	}

	public static String dateTime(String pattern, String value) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		String date = simpleDateFormat.format(value);
		return date;
	}

}
