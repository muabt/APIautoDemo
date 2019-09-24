package com.orchestranetworks.auto.addon.widget.general;


import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.LoadConfig;
import com.orchestranetworks.auto.addon.utils.Encode;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.SessionData;
import com.orchestranetworks.auto.addon.XFormat;
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
        if (!isElementExistNow(MENU_SELECTOR_PANE) && isElementExistNow(xPathBtn("Change dataspace"))) {
            clickBtn("Change dataspace");
        }
        return this;
    }

    @Override
    public NavigationWidget changeDataset() {
        switchOutDefaultIFrame();
        if (!isElementExistNow(MENU_SELECTOR_PANE)) {
            clickBtn("Select dataset");
        }
        return this;
    }

    @Override
    public void expandAllNavigationItems() {
        String xPathCollapseBtn = "//button[@title='Collapsed']";
        int numOfExpandedBtn = findAllElements(xPathCollapseBtn).size();
        for (int i = numOfExpandedBtn; i > 0; i--) {
            clickBtn("Collapsed", i);
        }
    }

    @Override
    public void expandNavigationItem(String[] itemList) {
        for (int i = 0; i < itemList.length - 1; i++) {
            String xPathCollapsed = String.format(XPATH_BTN_COLLAPSED, itemList[i].trim());
            System.out.println(xPathCollapsed);
            if (isElementExistNow(xPathCollapsed))
                clickOnElement(xPathCollapsed);
        }
    }

    @Override
    public void collapseAllNavigationItems() {
        String xPathExpandedBtn = "//button[@title='Expanded']";
        int numOfExpandedBtn = findAllElements(xPathExpandedBtn).size();
        for (int i = numOfExpandedBtn; i > 0; i--) {
            clickBtn("Expanded", i);
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
        waitAbit(2000);
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

    @Override
    public NavigationWidget selectAdministrationFeature() {
        if (getElement("//div[@id='ebx_SelectorPanel_c' or @id='ebx_Navigation']").getAttribute("style").contains("hidden"))
            clickBtn("Select an administration feature");
        switchToIFrame(Constants.IFRAME_LEGACY);
        return this;
    }

    @Override
    public boolean isDataspaceExist(String dataspace) {
        dataspace = Encode.of(SessionData.getValueFromSession(Constants.DATASPACE_IDENTIFIER));
        RequestSpecification httpRequest = RestAssured.given()
                .spec(LoadConfig.requestSpecification())
                .queryParam("includeClosed", "true")
                .log().all();

        Response response = httpRequest.post("/ebx-dataservices/rest/data/v1/B" + dataspace + ":information");
        return response.getStatusCode() == 200;
    }
}
