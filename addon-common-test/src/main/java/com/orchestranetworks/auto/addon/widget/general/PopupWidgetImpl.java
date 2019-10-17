package com.orchestranetworks.auto.addon.widget.general;

import com.orchestranetworks.auto.addon.utils.Constants;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

public class PopupWidgetImpl extends BaseWidgetImpl implements PopupWidget {

    public PopupWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement,
                           long timeoutInMilliseconds) {
        super(page, locator, webElement, timeoutInMilliseconds);
    }

    public PopupWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }

    public static final String XPATH_POPUP = "//div[@id='ebx_DialogBox']";
    public static final String XPATH_UNMERGE_POPUP = "//div[@class='_ebx-pop-up']//div[@class='_ebx-notification-box_list_item']";

    @Override
    public void confirmOK() {
        String xPath = XPATH_POPUP + "//button[text()='OK']|//div[@class='_ebx-pop-up']//button[contains(.,'OK')]|//div[contains(@class,'ebx_DialogBoxFooterToolbar')]//button[contains(.,'OK')]";
        clickOnElement(xPath);
        waitForInvisibilityOfElement(xPath);
    }

    @Override
    public void confirmYES() {
        String xPath = XPATH_POPUP + "//button[text()='Yes']";
        clickOnElement(xPath);
        waitForInvisibilityOfElement(xPath);
    }

    @Override
    public void clickBtnClose() {
        String xPath = XPATH_POPUP + "//button[text()='Close']|//div[@class='_ebx-pop-up']//button[contains(.,'Close')]";
        clickOnElement(xPath);
        waitForInvisibilityOfElement(xPath);
    }

    @Override
    public String getTextPopupRunMatch() {
        switchOutDefaultIFrame();
        switchToIFrame(Constants.IFRAME_LEGACY);
        switchToLastIFrame();
        return getTextValue(XPATH_POPUP + "//p").trim();
    }
    @Override
    public String getTextPopup() {
        switchOutDefaultIFrame();
        return getTextValue(XPATH_UNMERGE_POPUP).trim();
    }

}
