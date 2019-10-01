package com.orchestranetworks.auto.addon.pages;

import com.orchestranetworks.auto.addon.utils.Constants;
import com.orchestranetworks.auto.addon.widget.general.*;
import com.orchestranetworks.auto.addon.widget.workspace.DataspaceBriefInfoWidget;
import com.orchestranetworks.auto.addon.widget.workspace.DataspaceBriefInfoWidgetImpl;
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

    public NavigationWidget getNavPanel() {
        return navPanel;
    }
}
