package com.orchestranetworks.auto.addon.widget.general;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.LogWork;
import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

public class HeaderWidgetImpl extends BaseWidgetImpl implements HeaderWidget {
    public HeaderWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement,
                            long timeoutInMilliseconds) {
        super(page, locator, webElement, timeoutInMilliseconds);
    }

    public HeaderWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }

    private static final String TITLE_MENU_TITLE_DATASET = "Data";
    private static final String TITLE_MENU_TITLE_DATASPACE = "Dataspaces";
    private static final String TITLE_MENU_TITLE_WORKFLOW = "Data workflows";
    private static final String TITLE_MENU_TITLE_INSIGHT = "Insight";
    private static final String TITLE_MENU_TITLE_DATAMODEL = "Data models";
    private static final String TITLE_MENU_TITLE_WORKFLOW_MODEL = "Workflow models";
    private static final String TITLE_MENU_TITLE_SERVICE = "Data services";
    private static final String TITLE_MENU_TITLE_ADMINISTRATION = "Administration";

    private static final String XPATH_MENU = "//*[@title='%s']";
    private static final String XPATH_USER_CARD = "//button[*[contains(@*,'avatar')]]";
    private static final String XPATH_SELECT_PERSPECTIVE = "//button[@title='Select perspective']";

    @Override
    public void accessMenu(String menu) {
        switch (menu.toLowerCase()) {
            case "dataset":
                menu = TITLE_MENU_TITLE_DATASET;
                break;
            case "dataspace":
                menu = TITLE_MENU_TITLE_DATASPACE;
                break;
            case "workflow":
                menu = TITLE_MENU_TITLE_WORKFLOW;
                break;
            case "insight":
                menu = TITLE_MENU_TITLE_INSIGHT;
                break;
            case "datamodel":
                menu = TITLE_MENU_TITLE_DATAMODEL;
                break;
            case "workflow model":
                menu = TITLE_MENU_TITLE_WORKFLOW_MODEL;
                break;
            case "data service":
                menu = TITLE_MENU_TITLE_SERVICE;
                break;
            case "administration":
                menu = TITLE_MENU_TITLE_ADMINISTRATION;
                break;
            default:
                LogWork.info("There is no menu or wrong XPATH");
                break;
        }
        clickOnElement(String.format(XPATH_MENU, menu));

    }

    @Override
    public void openUserCard() {
        clickOnElement(XPATH_USER_CARD);
    }

    @Override
    public void clickBtnSelectPerspective() {
        clickBtn("Select perspective");
    }

    @Override
    public boolean isHeaderExist() {
        return isElementExistNow(XPATH_USER_CARD);
    }

    @Override
    public void openUserPanel() {
        clickOnElement(XPATH_USER_CARD);
    }

    @Override
    public void selectPerspective(String perName) {
        clickBtn("Select perspective");
    }
}
