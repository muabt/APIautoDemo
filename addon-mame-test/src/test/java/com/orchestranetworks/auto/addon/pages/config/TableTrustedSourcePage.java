package com.orchestranetworks.auto.addon.pages.config;

import com.orchestranetworks.auto.addon.pages.BasePage;
import com.orchestranetworks.auto.addon.widget.config.MatchingProcessWidget;
import com.orchestranetworks.auto.addon.widget.general.NavigationWidget;
import com.orchestranetworks.auto.addon.widget.general.ToolbarWidget;
import com.orchestranetworks.auto.addon.widget.workspace.ItemCreationWidget;
import com.orchestranetworks.auto.addon.widget.workspace.RecordDetailWidget;
import com.orchestranetworks.auto.addon.widget.workspace.TableViewWidget;
import org.openqa.selenium.WebDriver;

public class TableTrustedSourcePage extends BasePage {
    public TableTrustedSourcePage(WebDriver driver) {
        super(driver);
    }

    NavigationWidget navigationWidget;
    ToolbarWidget toolbarWidget;
    ItemCreationWidget iemCreationWidget;
    RecordDetailWidget recordDetailWidget;

    public NavigationWidget getNavPanel() {
        return navigationWidget;
    }

    public ToolbarWidget getToolbar() {
        return toolbarWidget;
    }

    public ItemCreationWidget getItemCreationWidget() {
        return iemCreationWidget;
    }

    public RecordDetailWidget getRecordDetailWidget() {
        return recordDetailWidget;
    }
}
