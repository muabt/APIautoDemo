package com.orchestranetworks.auto.addon.pages.config;

import com.orchestranetworks.auto.addon.pages.BasePage;
import com.orchestranetworks.auto.addon.widget.config.SourceWidget;
import com.orchestranetworks.auto.addon.widget.config.SourceWidgetImpl;
import com.orchestranetworks.auto.addon.widget.general.NavigationWidget;
import com.orchestranetworks.auto.addon.widget.general.ToolbarWidget;
import com.orchestranetworks.auto.addon.widget.workspace.ItemCreationWidget;
import com.orchestranetworks.auto.addon.widget.workspace.RecordDetailWidget;
import com.orchestranetworks.auto.addon.widget.workspace.TableViewWidget;
import org.openqa.selenium.WebDriver;

public class FieldTrustedSourcePage extends BasePage {
    public FieldTrustedSourcePage(WebDriver driver) {
        super(driver);
        sourceWidget = new SourceWidgetImpl(this,null,100);
    }

    private NavigationWidget navigationWidget;
    private ToolbarWidget toolbarWidget;
    private ItemCreationWidget itemCreationWidget;
    private RecordDetailWidget recordDetailWidget;
    private TableViewWidget defaultViewWidget;
    private SourceWidget sourceWidget;

    public NavigationWidget getNavPanel() {
        return navigationWidget;
    }

    public ToolbarWidget getToolbar() {
        return toolbarWidget;
    }

    public ItemCreationWidget getItemCreationWidget() {
        return itemCreationWidget;
    }

    public RecordDetailWidget getRecordDetailWidget() {
        return recordDetailWidget;
    }

    public TableViewWidget getDefaultViewWidget() {
        return defaultViewWidget;
    }

    public SourceWidget getSourceWidget(){
        return sourceWidget;
    }
}
