package com.orchestranetworks.auto.addon.widget.general;


import com.orchestranetworks.auto.addon.utils.Constants;
import com.orchestranetworks.auto.addon.utils.LoadConfig;
import io.restassured.RestAssured;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.utils.SessionData;
import com.orchestranetworks.auto.addon.utils.XFormat;
import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

public class NavigationWidgetImpl extends BaseWidgetImpl implements NavigationWidget {
    public static final String XPATH_NAVIGATION_ITEM = "//a//descendant-or-self::*[text()='%s']";
    public static final String XPATH_BTN_COLLAPSED = "//li[descendant-or-self::*[contains(text(),'%1$s')]]//button[@title='Collapsed'] | //table[contains(@class,'collapsed')][descendant::*[text()='%1$s']]//a";
    public static final String MENU_SELECTOR_PANE = "//div[contains(@class,'navigation-menu-selector_modeless') and not(contains(@style,'hidden'))]";


    public NavigationWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement,
                                long timeoutInMilliseconds) {
        super(page, locator, webElement, timeoutInMilliseconds);
    }

    public NavigationWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }

    @Override
    public NavigationWidget changeDataspace() {
        switchOutDefaultIFrame();
        if (!isElementExistNow(MENU_SELECTOR_PANE) && isElementExistNow(xPathBtn(Constants.BTN_CHANGE_DATASPACE))) {
            clickBtn(Constants.BTN_CHANGE_DATASPACE);
        }
        return this;
    }

    @Override
    public NavigationWidget changeDataset() {
        switchOutDefaultIFrame();
        if (!isElementExistNow(MENU_SELECTOR_PANE)) {
            clickBtn(Constants.BTN_SELECT_DATASET);
        }
        return this;
    }

    @Override
    public void expandAllNavigationItems() {
        String xPathCollapseBtn = "//button[@title='Collapsed']";
        int numOfExpandedBtn = findAllElements(xPathCollapseBtn).size();
        for (int i = numOfExpandedBtn; i > 0; i--) {
            clickBtn(Constants.BTN_COLLAPSED, i);
        }
    }

    @Override
    public void expandNavigationItem(String[] itemList) {
        for (int i = 0; i < itemList.length - 1; i++) {
            String xPathCollapsed = String.format(XPATH_BTN_COLLAPSED, itemList[i].trim());
            if (isElementExistNow(xPathCollapsed))
                clickOnElement(xPathCollapsed);
        }
    }

    @Override
    public void collapseAllNavigationItems() {
        String xPathExpandedBtn = "//button[@title='Expanded']";
        int numOfExpandedBtn = findAllElements(xPathExpandedBtn).size();
        for (int i = numOfExpandedBtn; i > 0; i--) {
            clickBtn(Constants.BTN_EXPANDED, i);
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
        scrollElementIntoCenterView(xpath).click();
    }

    @Override
    public void goToPath(String path) {
        String[] itemList = path.split(">");
        expandNavigationItem(itemList);
        accessNavigationItem(itemList[itemList.length - 1].trim());
    }

    @Override
    public NavigationWidget clickBtnActions() {
        clickBtn("//div[@id='ebx_Navigation']",Constants.BTN_ACTIONS);
        return this;
    }
    @Override
    public void selectService(String service) {
        clickOnElement("//li//a[.='"+service+"']");

    }

    @Override
    public NavigationWidget selectAdministrationFeature() {
        if (getElement("//div[@id='ebx_SelectorPanel_c' or @id='ebx_Navigation']").getAttribute("style").contains("hidden"))
            clickBtn(Constants.BTN_SELECT_ADMIN_FEATURE);
        switchToIFrame(Constants.IFRAME_LEGACY);
        return this;
    }

    @Override
    public boolean isDataspaceExist(String dataspace) {
        dataspace = SessionData.getValueFromSession(Constants.DATASPACE_IDENTIFIER);
        RequestSpecification httpRequest = RestAssured.given()
                .spec(LoadConfig.requestSpecification())
                .queryParam("includeClosed", "true")
                .log().all();

        Response response = httpRequest.post("/ebx-dataservices/rest/data/v1/B" + dataspace + ":information");
        return response.getStatusCode() == 200;
    }
    
}
