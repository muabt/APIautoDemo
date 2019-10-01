package com.orchestranetworks.auto.addon.pages;

import com.orchestranetworks.auto.addon.widget.general.*;
import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.widget.workspace.ItemCreationWidget;
import com.orchestranetworks.auto.addon.widget.workspace.ItemCreationWidgetImpl;
import com.orchestranetworks.auto.addon.widget.workspace.RecordDetailWidget;
import com.orchestranetworks.auto.addon.widget.workspace.TableViewWidget;

import java.util.Collection;

public class RecordDetailPage extends BasePage {
    private ToolbarWidget toolbar;
    private NavigationWidget navPanel;
    private HeaderWidget headerWidget;
    private FooterWidget footerWidget;
    private RecordDetailWidget recordDetailWidget;
    private PopupWidget popupWidget;

    private TableViewWidget defaultViewWidget;
    private ItemCreationWidget itemCreationWidget;

    public RecordDetailPage(WebDriver driver) {
        super(driver);
    }

    public ToolbarWidget getToolbar() {
        return toolbar;
    }

    public HeaderWidget getHeaderWidget() {
        return headerWidget;
    }

    public FooterWidget getFooterWidget() {
        return footerWidget;
    }

    public TableViewWidget getDefaultViewWidget() {
        return defaultViewWidget;
    }

    public ItemCreationWidget getItemCreationWidget() {
        return itemCreationWidget;
    }

    public RecordDetailWidget getRecordDetailWidget() {
        return recordDetailWidget;
    }

    public void setRecordDetailWidget(RecordDetailWidget recordDetailWidget) {
        this.recordDetailWidget = recordDetailWidget;
    }

    public PopupWidget getPopupWidget() {
        return popupWidget;
    }


}
