package com.orchestranetworks.auto.addon.widget;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;
import net.serenitybdd.core.pages.PageObject;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

public class DashboardWidgetImpl extends BaseWidgetImpl implements DashboardWidget {

    private static final String XPATH_CONFIGURATION_PANE = "//div[@class='configuration-menu']";
    private static final String XPATH_DBSETTING_TABS = "//div[@class='dpra-button dpra-icon icon-setting enable']";
    //private static final String XPATH_DBINDICATOR_TABS = "//div[@class='dpra-button dpra-icon icon-indicator selected']";
    private static final String XPATH_EXPAND_FRENCH = "//div..";

    public DashboardWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement, long timeoutInMilliseconds) {
        super(page, locator, webElement, timeoutInMilliseconds);
    }

    public DashboardWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }

    @Override
    public boolean getConfigurationPane() {
        isElementExistNow(XPATH_CONFIGURATION_PANE);
        return true;
    }

    @Override
    public void hoverShowDetailTooltip(String tabs) {
        hoverElement(XPATH_DBSETTING_TABS);
    }

    @Override
    public String getTooltip(String tabs) {
        switchOutDefaultIFrame();
        getElement(XPATH_DBSETTING_TABS);
        return tabs;
    }

    @Override
    public String getTextErrorDashboardNameField() {
        String xPathValue = "//tr[descendant::*[text()='Dashboard name']]//div[@class='ebx_Error']";
        String message = getText(xPathValue);
        return message;
    }

    @Override
    public String getPopupCloseContent() {
        switchOutDefaultIFrame();
        return getTextValue("//div[@class='_ebx-notification-box_list_item']");
    }

    @Override
    public void clickBtnExpandFrench() {
        clickBtn(XPATH_EXPAND_FRENCH);
    }

}
