package com.orchestranetworks.auto.addon.pages.config;

import com.orchestranetworks.auto.addon.pages.BasePage;
import com.orchestranetworks.auto.addon.widget.general.NavigationWidget;
import com.orchestranetworks.auto.addon.widget.general.PopupWidget;
import com.orchestranetworks.auto.addon.widget.general.ToolbarWidget;
import com.orchestranetworks.auto.addon.widget.workspace.DefaultViewImpl;
import com.orchestranetworks.auto.addon.widget.workspace.ItemCreationWidget;
import com.orchestranetworks.auto.addon.widget.workspace.TableViewWidget;
import org.openqa.selenium.WebDriver;

public class SourcePage extends BasePage {
    public SourcePage(WebDriver driver) {
        super(driver);
        this.defaultViewWidget = new DefaultViewImpl(this, null, 100);
    }

    private NavigationWidget navigationWidget;
    private ToolbarWidget toolbarWidget;
    private ItemCreationWidget itemCreationWidget;
    private TableViewWidget defaultViewWidget;
    private PopupWidget popupWidget;

    public NavigationWidget getNavPanel() {
        return navigationWidget;
    }

    public ToolbarWidget getToolbarWidget() {
        return toolbarWidget;
    }

    public ItemCreationWidget getItemCreationWidget() {
        return itemCreationWidget;
    }

    public TableViewWidget getDefaultViewWidget() {
        return defaultViewWidget;
    }

    public PopupWidget getPopupWidget() {
        return popupWidget;
    }

}
