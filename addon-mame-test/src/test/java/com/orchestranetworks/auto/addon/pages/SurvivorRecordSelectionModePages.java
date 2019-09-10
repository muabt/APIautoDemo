package com.orchestranetworks.auto.addon.pages;

import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.common.WebPageObject;


public class SurvivorRecordSelectionModePages  extends WebPageObject {
	public SurvivorRecordSelectionModePages(WebDriver driver) {
		super(driver);
	}
	public String get_text_of_reset_button() {
		String xPath = "(//div[@class='resetSection']/button)[1]";
		return getElement(xPath).getAttribute("title");	
	}
	
	public String get_value_cancel_last_action(String status) {
		String xPath = "//div[@class='resetSection']/button/img";
		if(getElement(xPath).getAttribute("src").contains("inactive")) {
			status = "inactive";
		} else {
			status = "active";
		}
		return status;
	}

	public String get_text_of_cancel_action_button() {
		String xPath = "(//div[@class='resetSection']/button)[2]";
		return getElement(xPath).getAttribute("title");		
	}
	public String get_actual_table_name() {
		String xPathTableName = "(//div[@class=\"ui-dropdown-content-left\"]/span)[2]";
		return getTextValue(xPathTableName);
	}

}
