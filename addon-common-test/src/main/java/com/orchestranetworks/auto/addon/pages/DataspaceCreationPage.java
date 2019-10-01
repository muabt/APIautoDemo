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
