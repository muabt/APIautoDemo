package com.orchestranetworks.auto.addon.pages;

import com.orchestranetworks.auto.addon.utils.Constants;
import com.orchestranetworks.auto.addon.widget.ChangeStateWidgetImpl;
import com.orchestranetworks.auto.addon.widget.ChangeStateWidget;
import com.orchestranetworks.auto.addon.widget.ChangeStateWidgetImpl;
import org.openqa.selenium.WebDriver;

public class ChangeStatePage extends BasePage {
    private ChangeStateWidget changeStateWidget;

    public ChangeStatePage(WebDriver driver) {
        super(driver);
        this.changeStateWidget = new ChangeStateWidgetImpl(this, null, 100);
    }
    public ChangeStateWidget getChangeStateWidget() {
        switchToIFrame(Constants.IFRAME_SERVICE);
        return changeStateWidget;
    }


}
