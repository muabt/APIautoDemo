package com.orchestranetworks.auto.addon.pages;

import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.widget.MetadataWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

import com.orchestranetworks.auto.addon.widget.MetadataWidget;

public class MetadataPage extends BasePage {
	private MetadataWidget metadataWidget;

	public MetadataPage(WebDriver driver) {
		super(driver);
		this.metadataWidget = new MetadataWidgetImpl(this, null, 100);
	}

	public MetadataWidget getMetadata() {
		switchToIFrame("serviceIframe");
		return metadataWidget;
	}
	

}