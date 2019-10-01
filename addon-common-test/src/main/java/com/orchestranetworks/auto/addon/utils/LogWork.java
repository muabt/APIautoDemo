package com.orchestranetworks.auto.addon.utils;

import org.apache.log4j.Logger;

public class LogWork {
	public static Logger logs = Logger.getLogger(LogWork.class);

	private LogWork() {
	}

	public static void debug(String msg) {
		logs.debug(">> ONVN debug: | " + msg);
		System.out.println(">> ONVN debug: | " + msg);
	}

	public static void info(String msg) {
		logs.info(">> ONVN info: | " + msg);
		System.out.println(">> ONVN info: | " + msg);
	}

	public static void warn(String msg) {
		logs.warn(">> ONVN warn: | " + msg);
		System.out.println(">> ONVN warn: |" + msg);
	}

	public static void error(String msg) {
		logs.error(">> ONVN error: | " + msg);
		System.err.println(">> ONVN error: |" + msg);
	}

}
