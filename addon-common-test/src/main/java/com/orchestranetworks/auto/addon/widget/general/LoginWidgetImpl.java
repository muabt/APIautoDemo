package com.orchestranetworks.auto.addon.widget.general;

import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

public class LoginWidgetImpl extends BaseWidgetImpl implements LoginWidget {
    public LoginWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }

    private static final String XPATH_INPUT_PASSWORD = "//input[@name='password']";
    private static final String XPATH_INPUT_NAME = "//input[@name='login']";

    private static final String XPATH_USER_ERROR = "//div[child::input[@type='text']]//p[@class='_ebx-component-with-label_message']|//div[@class='_login_form_error']";
    private static final String XPATH_PASS_ERROR = "//div[child::input[@type='password']]//p[@class='_ebx-component-with-label_message']";

    @Override
    public LoginWidget enterUsername(String userName) {
        waitTypeAndTab(XPATH_INPUT_NAME, userName);
        return this;
    }

    @Override
    public void enterPassword(String password) {
        waitTypeAndTab(XPATH_INPUT_PASSWORD, password);
    }

    @Override
    public void clickBtnLogin() {
        clickBtn("Log in");
        waitForInvisibilityOfElement(XPATH_INPUT_PASSWORD);
        removeChooseDatasetDiv();
    }
}
