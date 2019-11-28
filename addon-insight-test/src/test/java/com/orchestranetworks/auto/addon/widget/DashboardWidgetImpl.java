package com.orchestranetworks.auto.addon.widget;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;
import net.serenitybdd.core.pages.PageObject;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

public class DashboardWidgetImpl extends BaseWidgetImpl implements DashboardWidget {

    private static final String XPATH_BUTTON_DBSETTING= "//div... " ;
    private static final String XPATH_TABS = "//div...";

    public DashboardWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement, long timeoutInMilliseconds) {
        super(page, locator, webElement, timeoutInMilliseconds);
    }

    public DashboardWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }

    @Override
    public void getConfigurationPane() {
        clickOnElement(XPATH_BUTTON_DBSETTING);
    }

    @Override
    public void hoverShowDetailTooltip(String tabs) {
        hoverElement(XPATH_TABS);
    }

    @Override
    public String getTooltip(String tabs) {
        switchOutDefaultIFrame();
        getElement(XPATH_TABS);
        return tabs;
    }
    @Override
    public String getTextErrorDashboardNameField() {
        String xPathValue = "//tr[descendant::*[text()='Dashboard name']]//div[@class='ebx_Error']";
        String message = getText(xPathValue);
        return message;
    }


    @Override
    public String getTextErrorDashboardInBlock() {
        String xPathValue = "//li[descendant::*[text()='Data model']]//span";
        String message = getText(xPathValue);
        return message;
    }

}