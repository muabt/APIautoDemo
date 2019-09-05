package com.orchestranetworks.auto.addon;

import java.io.File;
import java.util.HashMap;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import net.thucydides.core.webdriver.DriverSource;

public class CustomChromeDriver implements DriverSource {
	static String fseparator = File.separator;

	@Override
	public WebDriver newDriver() {
		String downloadFilepath = FileUtils.getDataFolderPath() + LoadConfig.getDownloadFolder();
		String pathToChrome = System.getProperty("user.dir") + fseparator + LoadConfig.getDriverExecution();
		System.setProperty("webdriver.chrome.driver", pathToChrome);
		HashMap<String, Object> chromePrefs = new HashMap<String, Object>();
		chromePrefs.put("profile.default_content_settings.popups", 0);
		chromePrefs.put("download.default_directory", downloadFilepath);
		ChromeOptions options = new ChromeOptions();
		options.setExperimentalOption("prefs", chromePrefs);
		WebDriver driver = new ChromeDriver(options);
		return driver;
	}

	@Override
	public boolean takesScreenshots() {
		return false;
	}
}
