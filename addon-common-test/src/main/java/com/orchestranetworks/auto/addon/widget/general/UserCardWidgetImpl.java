package com.orchestranetworks.auto.addon.widget.general;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.core.pages.WidgetObjectImpl;

public class UserCardWidgetImpl extends BaseWidgetImpl implements UserCardWidget {
    public UserCardWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement,
                              long timeoutInMilliseconds) {
        super(page, locator, webElement, timeoutInMilliseconds);
    }

    public UserCardWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }

    private static final String XPATH_BTN_LANGUAGE = "//span[.='Language']";
    private static final String XPATH_SELECTED_LANGUAGE = "//span[@class='_ebx-menu_item_label' and text()='%s']";

    @Override
    public void clickBtnLogout() {
        clickBtn("Logout");
    }

    @Override
    public void changeLanguage(String name) {
        clickOnElement(XPATH_BTN_LANGUAGE);
        clickOnElement(String.format(XPATH_SELECTED_LANGUAGE,name));
    }
}
