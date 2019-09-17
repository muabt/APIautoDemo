package com.orchestranetworks.auto.addon.pages;

import java.util.List;

import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.widget.ManageGroupWidget;
import com.orchestranetworks.auto.addon.widget.MetadataWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

import com.orchestranetworks.auto.addon.widget.MetadataWidget;

public class MetadataPage extends  PageObject{
	private MetadataWidget metadataWidget;
	private ManageGroupWidget manageGroupWidget;

	public MetadataPage(WebDriver driver) {
		super();
		this.metadataWidget = new MetadataWidgetImpl(this, null, 100);
	}

	public MetadataWidget getMetadata() {
		return metadataWidget;
	}

	public ManageGroupWidget getmanageGroup() {
		return manageGroupWidget;
	}

}