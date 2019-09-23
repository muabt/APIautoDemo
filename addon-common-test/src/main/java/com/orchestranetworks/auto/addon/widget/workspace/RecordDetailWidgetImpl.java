package com.orchestranetworks.auto.addon.widget.workspace;

import com.orchestranetworks.auto.addon.XFormat;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

public class RecordDetailWidgetImpl extends BaseWidgetImpl implements RecordDetailWidget {

    private static final String MERGE_POLICY_TAB = "//ul[@id='ebx_WorkspaceFormTabviewTabs']//span[text()='%s']/ancestor::li";

    public RecordDetailWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement,
                                  long timeoutInMilliseconds) {
        super(page, locator, webElement, timeoutInMilliseconds);
    }

    public RecordDetailWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }

    @Override
    public void clickOnTabOfLabel(String label) {
        String xPath = "//ul[@id='ebx_WorkspaceFormTabviewTabs']//span[contains(text(),'" + label + "')]";
        clickOnElement(xPath);
    }

    @Override
    public void selectTab(String tabName) {
        waitForAllLoadingCompleted();
        clickByJS(XFormat.of(MERGE_POLICY_TAB, tabName));
    }

    @Override
    public void selectRadioButton(String label, String value) {
        waitForAllLoadingCompleted();
        selectRadioBoxGroup(label, value);
    }

    @Override
    public void addAnOccurrence() {
        clickBtn("Add an occurrence");
    }
}
