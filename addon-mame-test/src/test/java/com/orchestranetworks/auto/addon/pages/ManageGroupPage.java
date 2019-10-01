package com.orchestranetworks.auto.addon.pages;

import com.orchestranetworks.auto.addon.utils.Constants;
import com.orchestranetworks.auto.addon.widget.managegroup.ManageGroupWidget;
import com.orchestranetworks.auto.addon.widget.managegroup.ManageGroupWidgetImpl;
import org.openqa.selenium.WebDriver;

public class ManageGroupPage extends BasePage {
    private ManageGroupWidget manageGroupWidget;

    public ManageGroupPage(WebDriver driver) {
        super(driver);
        this.manageGroupWidget = new ManageGroupWidgetImpl(this, null, 100);
    }

    public ManageGroupWidget getManageGroupWidget() {
        switchOutDefaultIFrame();
        switchToIFrame(Constants.IFRAME_LEGACY);
        switchToIFrame(Constants.IFRAME_INTERNAL_POPUP);
        return manageGroupWidget;
    }

}
