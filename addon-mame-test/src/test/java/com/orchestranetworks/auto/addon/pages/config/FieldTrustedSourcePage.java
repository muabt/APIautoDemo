package com.orchestranetworks.auto.addon.pages.config;

import com.orchestranetworks.auto.addon.pages.BasePage;
import com.orchestranetworks.auto.addon.widget.general.NavigationWidget;
import com.orchestranetworks.auto.addon.widget.general.ToolbarWidget;
import com.orchestranetworks.auto.addon.widget.workspace.ItemCreationWidget;
import com.orchestranetworks.auto.addon.widget.workspace.RecordDetailWidget;
import org.openqa.selenium.WebDriver;

public class FieldTrustedSourcePage extends BasePage {
    public FieldTrustedSourcePage(WebDriver driver) {
        super(driver);
    }

    private NavigationWidget navigationWidget;
    private ToolbarWidget toolbarWidget;
    private ItemCreationWidget itemCreationWidget;
    private RecordDetailWidget recordDetailWidget;

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
}
