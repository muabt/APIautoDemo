package com.orchestranetworks.auto.addon.pages;

import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.utils.MAMEConstants;
import com.orchestranetworks.auto.addon.widget.ManageGroupWidget;
import com.orchestranetworks.auto.addon.widget.ManageGroupWidgetImpl;
import com.orchestranetworks.auto.addon.widget.general.ToolbarWidget;
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
