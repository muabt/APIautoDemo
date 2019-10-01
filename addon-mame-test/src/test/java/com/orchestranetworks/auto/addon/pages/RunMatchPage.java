package com.orchestranetworks.auto.addon.pages;

import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.utils.Constants;
import com.orchestranetworks.auto.addon.widget.MatchingFieldWidget;
import com.orchestranetworks.auto.addon.widget.MatchingProcessWidget;
import com.orchestranetworks.auto.addon.widget.RunMatchWidget;
import com.orchestranetworks.auto.addon.widget.workspace.ItemCreationWidget;
import com.orchestranetworks.auto.addon.widget.workspace.RecordDetailWidget;

public class RunMatchPage extends BasePage {
	private MatchingProcessWidget matchingProcessWidget;
	
	private RunMatchWidget runMatchWidget;
	private RecordDetailWidget recordDetailWidget;
	private ItemCreationWidget itemCreationWidget;
	private MatchingFieldWidget matchingFieldWidget;

	public RunMatchPage(WebDriver driver) {
		super(driver);
	}

	public RunMatchWidget getRunMatchWidget() {
		switchToIFrame(Constants.IFRAME_SERVICE);
		return this.runMatchWidget;
	}

	public RecordDetailWidget getRecordDetailWidget() {
		return recordDetailWidget;
	}

	public ItemCreationWidget getItemCreationWidget() {
		return itemCreationWidget;
	}

	public MatchingProcessWidget getMatchingProcessWidget() {
		return matchingProcessWidget;
	}

	public MatchingFieldWidget getMatchingFieldWidget() {
		return matchingFieldWidget;
	}

}