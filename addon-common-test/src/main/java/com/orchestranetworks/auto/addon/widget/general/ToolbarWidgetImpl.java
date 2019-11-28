package com.orchestranetworks.auto.addon.widget.general;

import com.orchestranetworks.auto.addon.utils.Constants;
import com.orchestranetworks.auto.addon.utils.XFormat;
import net.serenitybdd.core.pages.WebElementFacade;
import net.serenitybdd.screenplay.actions.ClickOnElement;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.remote.server.handler.ClickElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

import java.util.List;

public class ToolbarWidgetImpl extends BaseWidgetImpl implements ToolbarWidget {
    public ToolbarWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement,
                             long timeoutInMilliseconds) {
        super(page, locator, webElement, timeoutInMilliseconds);
    }

    public ToolbarWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }

    private static final String TOOLBAR_BTN = "//button[contains(@title,'%s')]";
    private static final String NAVIGATION_ITEM = "//a//descendant-or-self::*[text()='%s']";
    private static final String NAVIGATION_DATASET = "//descendant-or-self::*[text()='%s']";
    private static final String XPATH_BTN_ACTIONS="//button[.='Actions']";

    @Override
    public void clickBtnFilter() {
        clickBtn("Filters");
    }

    @Override
    public void clickBtnView() {
        clickBtn("View");
    }

    @Override
    public ToolbarWidget clickBtnActions() {
        clickBtn(Constants.BTN_ACTIONS);
        return this;
    }

    @Override
    public ToolbarWidget clickBtnDatasetActions() {
        clickOnElement("//div[contains(@class,'navigation')]//button[contains(.,'Actions')]");
        return this;
    }

    @Override
    public ToolbarWidget clickBtnActionsDisplayed() {
        List<WebElementFacade> list = findAllElements(XPATH_BTN_ACTIONS);
        if (list.size() > 1) {
            for (int i = 0; i < list.size(); i++) {
                WebElementFacade e = list.get(i);
                if (e.isDisplayed() && e.isCurrentlyEnabled()) {
                    e.waitUntilClickable().click();
                    break;
                }
            }
        } else {
            list.get(0).waitUntilClickable().click();
        }
        return this;
    }

    @Override
    public void selectService(String service) {
        String[] services = service.split(">");
        for (int i = 0; i < services.length; i++) {
            clickOnElement(XFormat.of(NAVIGATION_ITEM, services[i].trim()));
        }
        waitForAllLoadingCompleted();
        switchToLastIFrame();
    }

    @Override
    public void selectDatasetService(String service){
        String[] services = service.split(">");
        for (int i = 0; i < services.length; i++) {
            clickOnElement(XFormat.of(NAVIGATION_DATASET, services[i].trim()));
        }
        waitForAllLoadingCompleted();
        switchToLastIFrame();

    }

    @Override
    public void clickNextPage() {
        clickOnElement(XFormat.of(TOOLBAR_BTN, "next"));
    }

    @Override
    public void clickPreviousPage() {
        clickOnElement(XFormat.of(TOOLBAR_BTN, "previous"));
    }

    @Override
    public void clickLastPage() {
        clickOnElement(XFormat.of(TOOLBAR_BTN, "last"));
    }

    @Override
    public void clickFirstPage() {
        clickOnElement(XFormat.of(TOOLBAR_BTN, "first"));
    }

    @Override
    public void clickBtnCreateRecord() {
        waitForAllLoadingCompleted();
        switchToLastIFrame();
        clickBtn(Constants.BTN_CREATE_A_RECORD);
    }

    @Override
    public void clickBtnCreateDataspace() {
        clickBtn(Constants.BTN_CREATE_A_DATASPACE);
    }

    @Override
    public void clickBtnCreateRecordMatchAndMerge(int index) {
        waitForAllLoadingCompleted();
        switchToLastIFrame();
        clickBtn(Constants.BTN_CREATE_A_RECORD,index);
        switchToIFrame(Constants.IFRAME_INTERNAL_POPUP);
    }
    public void clickCreateNewMatchingField() {
        String xPath_create_matching_field = "//button[@class='ebx_FlatButton ebx_IconButton ebx_Add'and@id='ebx_generatedId_77']//span[@class='ebx_Icon']";
        clickOnElement(xPath_create_matching_field);
        waitForAllLoadingCompleted();
    }

}
