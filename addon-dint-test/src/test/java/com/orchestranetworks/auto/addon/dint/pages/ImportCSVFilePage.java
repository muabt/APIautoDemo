package com.orchestranetworks.auto.addon.dint.pages;

import java.io.File;

import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.WebPageObject;

public class ImportCSVFilePage extends WebPageObject {
	static String fseparator = File.separator;

	public ImportCSVFilePage(WebDriver driver) {
		super(driver);
	}

	private static final String XPATH_BTN_EXPAND = "//button[@title='expand']";

	public void import_file(String fileName) {
		String projectFolder = System.getProperty("user.dir");

		String filePath = projectFolder + fseparator + "src" + fseparator + "main" + fseparator + "resources"
				+ fseparator + "data" + fseparator + "dint" + fseparator + fileName;
		System.err.println("file Path: " + filePath);
		String xPath = "//input[@type='file']";
		findBy(xPath).sendKeys(filePath);
		waitForAllLoadingCompleted();
		waitABit(5000);
	}

	public void click_on_import_btn() {
		clickBtn("Import");
		waitAbit(5000);
	}

	public void click_on_expands_button() {
		findBy(XPATH_BTN_EXPAND).click();
		waitForAllLoadingCompleted();

	}

	public void select_radio_box(String label, String value) {
		scrollElementIntoCenterView(xPathRadioBoxGroup("", label, value, 1));
		waitAbit(500);
		selectRadioBoxGroup(label, value);
	}

	public void input_option_with_label(String label, String value) {
		waitTypeAndTabWithLabel(label, value);
	}

}
