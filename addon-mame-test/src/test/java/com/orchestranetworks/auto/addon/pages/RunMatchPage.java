package com.orchestranetworks.auto.addon.pages;

import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.widget.RunMatchWidget;

public class RunMatchPage  extends BasePage {
	private RunMatchWidget runMatchWidget;

	public RunMatchPage(WebDriver driver) {
		super(driver);
	}

	public RunMatchWidget getRunMatchWidget() {
		switchToIFrame(Constants.IFRAME_SERVICE);
		return this.runMatchWidget;
	}
	

}