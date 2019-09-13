package com.orchestranetworks.auto.addon.pages;

import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.widget.general.*;
import com.orchestranetworks.auto.addon.widget.workspace.AdministrationWidgetImpl;
import com.orchestranetworks.auto.addon.widget.workspace.DataspaceBriefInfoWidget;
import com.orchestranetworks.auto.addon.widget.workspace.DataspaceBriefInfoWidgetImpl;
import net.serenitybdd.core.pages.PageObject;
import org.openqa.selenium.WebDriver;

public class DataspaceBriefInfoPage extends BasePage {
    private ToolbarWidget toolbar;
    private NavigationWidget navPanel;
    private HeaderWidget header;
    private FooterWidget footer;
    private DataspaceBriefInfoWidget dataspaceBriefInfoWidget;
    private PopupWidget popupWidget;

    public DataspaceBriefInfoPage(WebDriver driver) {
        super(driver);
        this.toolbar = new ToolbarWidgetImpl(this, null, 100);
        this.navPanel = new NavigationWidgetImpl(this, null, 100);
        this.header = new HeaderWidgetImpl(this, null, 100);
        this.footer = new FooterWidgetImpl(this, null, 100);
        this.dataspaceBriefInfoWidget = new DataspaceBriefInfoWidgetImpl(this, null, 100);
        this.popupWidget = new PopupWidgetImpl(this, null, 100);
    }

    public DataspaceBriefInfoWidget getDataspaceBriefInforWidget() {
        switchToIFrame(Constants.IFRAME_LEGACY);
        return dataspaceBriefInfoWidget;
    }

    public ToolbarWidget getToolbarWidget() {
        switchToIFrame(Constants.IFRAME_LEGACY);
        return toolbar;
    }

    public PopupWidget getPopupWidget() {
        return popupWidget;
    }
}
