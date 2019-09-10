package com.orchestranetworks.auto.addon.widget.general;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;
import net.serenitybdd.core.pages.PageObject;
import org.openqa.selenium.support.pagefactory.ElementLocator;

public class LoginWidgetImpl extends BaseWidgetImpl implements LoginWidget {
    public LoginWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }

    @Override
    public void enterUsername(String userName) {

    }

    @Override
    public void enterPassword(String password) {

    }

    @Override
    public void clickBtnLogin() {

    }
}
