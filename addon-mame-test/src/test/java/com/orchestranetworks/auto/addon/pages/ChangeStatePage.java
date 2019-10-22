package com.orchestranetworks.auto.addon.pages;

import com.orchestranetworks.auto.addon.widget.ChangeStateWidget;
import com.orchestranetworks.auto.addon.widget.ChangeStateWidgetImpl;
import com.orchestranetworks.auto.addon.widget.general.NavigationWidget;
import org.openqa.selenium.WebDriver;

public class ChangeStatePage extends BasePage {
    private ChangeStateWidget changeStateWidget;
    private NavigationWidget navigationWidget;

    public ChangeStatePage(WebDriver driver) {
        super(driver);
        this.changeStateWidget = new ChangeStateWidgetImpl(this, null, 100);
    }

    public ChangeStateWidget getChangeStateWidget() {
        return changeStateWidget;
    }

    public NavigationWidget getNavigationWidget() {
        return navigationWidget;
    }


}
