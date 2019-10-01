package com.orchestranetworks.auto.addon.pages;

import com.orchestranetworks.auto.addon.widget.filter.TextSearchImpl;
import com.orchestranetworks.auto.addon.widget.general.*;
import com.orchestranetworks.auto.addon.widget.workspace.AdministrationWidgetImpl;
import com.orchestranetworks.auto.addon.widget.workspace.DataspaceCreationImpl;
import com.orchestranetworks.auto.addon.widget.workspace.DefaultViewImpl;
import com.orchestranetworks.auto.addon.widget.workspace.ItemCreationWidget;

import net.serenitybdd.core.pages.PageObject;
import org.openqa.selenium.WebDriver;

public class DataspaceCreationPage extends BasePage {
    private ToolbarWidget toolbar;
    private NavigationWidget navPanel;
    private HeaderWidget headerWidget;
    private FooterWidget footerWidget;

    private ItemCreationWidget dataspaceCreation;

    public DataspaceCreationPage(WebDriver driver) {
        super(driver);
        this.toolbar = new ToolbarWidgetImpl(this, null, 100);
        this.navPanel = new NavigationWidgetImpl(this, null, 100);
        this.headerWidget = new HeaderWidgetImpl(this, null, 100);
        this.footerWidget = new FooterWidgetImpl(this, null, 100);
        this.dataspaceCreation = new DataspaceCreationImpl(this, null, 100);
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

    public ItemCreationWidget getDataspaceCreationWidget() {
        return dataspaceCreation;
    }

}
