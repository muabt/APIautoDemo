package com.orchestranetworks.auto.addon.widget.filter;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.core.pages.WebElementFacade;

public class SearchWidgetImpl extends BaseWidgetImpl implements SearchWidget {

    public SearchWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement,
                            long timeoutInMilliseconds) {
        super(page, locator, webElement, timeoutInMilliseconds);
    }

    public SearchWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }

    @Override
    public void clickApply() {

    }

    @Override
    public void inputKeyword(String id) {

    }

    @Override
    public void clickBtnExpand() {
        clickBtn("expand");
    }

    @Override
    public void switchToFilterPanel() {
        switchToIFrame(Constants.IFRAME_LEGACY);

    }
}
