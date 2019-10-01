package com.orchestranetworks.auto.addon.pages;

import com.orchestranetworks.auto.addon.widget.general.PopupWidget;
import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.utils.Constants;
import com.orchestranetworks.auto.addon.widget.config.MatchingProcessWidget;
import com.orchestranetworks.auto.addon.widget.runmatch.RunMatchWidget;
import com.orchestranetworks.auto.addon.widget.workspace.ItemCreationWidget;
import com.orchestranetworks.auto.addon.widget.workspace.RecordDetailWidget;

public class RunMatchPage extends BasePage {
	private MatchingProcessWidget matchingProcessWidget;

    private RunMatchWidget runMatchWidget;
    private RecordDetailWidget recordDetailWidget;
    private ItemCreationWidget itemCreationWidget;
    private PopupWidget popupWidget;

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

    public PopupWidget getPopupWidget() {
        return popupWidget;
    }

}