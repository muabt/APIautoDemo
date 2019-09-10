package com.orchestranetworks.auto.addon.widget.general;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.SessionData;
import com.orchestranetworks.auto.addon.XFormat;
import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;


public class NavigationWidgetImpl extends BaseWidgetImpl implements NavigationWidget {
    public static final String XPATH_NAVIGATION_ITEM = "//a//descendant-or-self::*[text()='%s']";

    public NavigationWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement,
                                long timeoutInMilliseconds) {
        super(page, locator, webElement, timeoutInMilliseconds);
    }

    public NavigationWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }

    @Override
    public void changeDataspace() {
        removeChooseDatasetDiv();
        switchOutDefaultIFrame();
        clickBtn("Change dataspace");
    }

    @Override
    public void changeDataset() {
        removeChooseDatasetDiv();
        switchOutDefaultIFrame();
        clickBtn("Change dataset");
    }

    @Override
    public void expandNavigationItems() {

    }

    @Override
    public void expandNavigationItem(String path) {
        String[] itemList = path.split(">");
        collapseAll();
        for (int i = 0; i < itemList.length - 1; i++) {
            expandItem(itemList[i]);
            //TODO: add wait time
        }
    }

    @Override
    public void collapseNavigationItems() {
        collapseAll();
    }

    @Override
    public void collapseNavigationItem(String menu) {
        String xPathExpanded = "//li[descendant-or-self::*[contains(text(),'" + menu
                + "')]]//button[@title='Expanded']";
        findBy(xPathExpanded).waitUntilClickable().click();
    }

    @Override
    public void accessNavigationItem(String menu) {
        // No extents Webpageobject then using default method of serenity
        menu = SessionData.getValueFromSession(menu);
        findBy(XFormat.of(XPATH_NAVIGATION_ITEM, menu)).waitUntilClickable().click();
    }


    private void collapseAll() {
        String xPathExpandedBtn = xPathBtn("Expanded");
        int numOfExpandedBtn = thenFindAll(xPathExpandedBtn).size();
        for (int i = numOfExpandedBtn; i >= 1; i--) {
            clickBtn("Expanded", i);
        }
    }

    private void expandItem(String item) {
        String xPathCollapsed = "//li[descendant-or-self::*[contains(text(),'" + item
                + "')]]//button[@title='Collapsed']";
        if (isElementExistNow(xPathCollapsed)) {
            clickBtn(xPathCollapsed);
        }
    }

}
