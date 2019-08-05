package com.orchestranetworks.auto.addon.dint.pages;

import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.common.WebPageObject;

public class ImportCSVResultPage extends WebPageObject {

	private static final String XPATH_MODIFIED_RECORD = "(//div[.='Result']/parent::div//ul//li)[%s]";

	public ImportCSVResultPage(WebDriver driver) {
		super(driver);
	}

	public String get_text_of_total_result() {
		return getTextValue("//div[text()='Result']/following::div");
	}

	public String get_text_of_inserted_records() {
		return getTextValue(String.format(XPATH_MODIFIED_RECORD, "1"));
	}

	public String get_text_of_updated_records() {
		return getTextValue(String.format(XPATH_MODIFIED_RECORD, "2"));
	}

	public String get_text_of_deleted_records() {
		return getTextValue(String.format(XPATH_MODIFIED_RECORD, "3"));
	}

	public String get_text_of_unchanged_records() {
		return getTextValue(String.format(XPATH_MODIFIED_RECORD, "4"));
	}

	public String get_text_of_invalid_records() {
		return getTextValue(String.format(XPATH_MODIFIED_RECORD, "5"));
	}
}
