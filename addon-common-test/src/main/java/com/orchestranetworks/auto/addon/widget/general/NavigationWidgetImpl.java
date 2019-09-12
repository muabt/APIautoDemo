package com.orchestranetworks.auto.addon.widget.general;

import com.orchestranetworks.auto.addon.Constants;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.SessionData;
import com.orchestranetworks.auto.addon.XFormat;
import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

public class NavigationWidgetImpl extends BaseWidgetImpl implements NavigationWidget {
    public static final String XPATH_NAVIGATION_ITEM = "//a//descendant-or-self::*[text()='%s']";
    public static final String XPATH_BTN_COLLAPSED = "//li[descendant-or-self::*[contains(text(),'%1$s')]]//button[@title='Collapsed'] | //table[contains(@class,'collapsed')][descendant::*[text()='%1$s']]//a";

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
        if (isElementExistNow(xPathBtn("Change dataspace"))) {
            clickBtn("Change dataspace");
        }
    }

    @Override
    public void changeDataset() {
        removeChooseDatasetDiv();
        switchOutDefaultIFrame();
        if (isElementExistNow(xPathBtn("Select dataset"))) {
            clickBtn("Select dataset");
        }
    }

    @Override
    public void expandAllNavigationItems() {

    }

    @Override
    public void expandNavigationItem(String[] itemList) {
        for (int i = 0; i < itemList.length - 1; i++) {
            String xPathCollapsed = String.format(XPATH_BTN_COLLAPSED, itemList[i].trim());
            System.out.println(xPathCollapsed);
            if (isElementExistNow(xPathCollapsed))
                clickOnElement(xPathCollapsed);
            waitForInvisibilityOfElement(xPathCollapsed);
        }
    }

    @Override
    public void collapseAllNavigationItems() {
        String xPathExpandedBtn = "//button[@title='Expanded']";
        int numOfExpandedBtn = findAllElement(xPathExpandedBtn).size();
        for (int i = numOfExpandedBtn; i > 0; i--) {
            clickBtn("Expanded", i);
            waitForInvisibilityOfElement(xPathBtn("Expanded", i));
        }
    }

    @Override
    public void collapseNavigationItem(String menu) {
        String xPathExpanded = "//li[descendant-or-self::*[contains(text(),'" + menu
                + "')]]//button[@title='Expanded']";
        clickOnElement(xPathExpanded);
    }

    @Override
    public void accessNavigationItem(String menu) {
        menu = SessionData.getValueFromSession(menu);
        String xpath = XFormat.of(XPATH_NAVIGATION_ITEM, menu);
        clickOnElement(xpath);
    }
    
    @Override
    public void goToPath(String path) {
        String[] itemList = path.split(">");
        expandNavigationItem(itemList);
       accessNavigationItem(itemList[itemList.length - 1].trim());
    }

    @Override
    public void selectDatasetService(String service) {
    clickBtn("Actions");
    }

    @Override
    public void goToGroupAdministration(String item) {
		switchToIFrame(Constants.IFRAME_LEGACY);
		clickOnElement("//span/a[contains(text(),'" + item + "')]");
		clickOnElement("//div[@id='ebx_NavigationTree']//a");
		waitAbit(2000);
	}

    @Override
	public void goToAdministrationItem(String item) {
		clickOnElement("//span/a/span/span[contains(text(),'" + item + "')]");
		waitAbit(2000);
	}
}
