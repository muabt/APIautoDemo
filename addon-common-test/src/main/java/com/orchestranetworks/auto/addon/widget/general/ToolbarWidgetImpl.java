package com.orchestranetworks.auto.addon.widget.general;

import com.orchestranetworks.auto.addon.XFormat;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.annotations.findby.By;
import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.core.pages.WebElementFacade;

public class ToolbarWidgetImpl extends BaseWidgetImpl implements ToolbarWidget {
    public ToolbarWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement,
                             long timeoutInMilliseconds) {
        super(page, locator, webElement, timeoutInMilliseconds);
    }

    public ToolbarWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }

    private static final String NAVIGATION_ITEM = "//a//descendant-or-self::*[text()='%s']";

    @Override
    public void clickBtnFilter() {
        clickBtn("Filters");
    }

    @Override
    public WebElementFacade getBtnView() {
        return findBy(xPathBtn("View)"));
    }

    @Override
    public WebElementFacade getBtnActions() {
        return findBy(xPathBtn("Actions"));
    }

    @Override
    public void selectService(String service) {
        clickBtn("Actions");

        String[] services = service.split(">");
        for (int i = 0; i < services.length; i++) {
            clickOnElement(XFormat.of(NAVIGATION_ITEM, services[i].trim()));
        }
        waitForAllLoadingCompleted();
        switchToFirstIFrame();
        waitAbit(2000);
    }

    @Override
    public void clickNextPage() {

    }

    @Override
    public void clickBackPage() {

    }

    @Override
    public void clickLastPage() {

    }

    @Override
    public void clickFirstPage() {

    }

    @Override
    public void clickBtnCreateDataspace() {
        clickBtn("Create a dataspace");
    }
}
