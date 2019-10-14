package com.orchestranetworks.auto.addon.widget.workspace;

import com.orchestranetworks.auto.addon.utils.Constants;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

public class ItemCreationWidgetImpl extends BaseWidgetImpl implements ItemCreationWidget {

    private static final String XPATH_DATETIME = "//label[text()='%s']/ancestor::tr//span//input[contains(@name,'%s')]";

    public ItemCreationWidgetImpl(PageObject page, ElementLocator locator, WebElement webElement,
                                  long timeoutInMilliseconds) {
        super(page, locator, webElement, timeoutInMilliseconds);
    }

    public ItemCreationWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }

    @Override
    public void enterIdentifier(String id) {
        waitTypeAndTabWithLabel(Constants.LBL_IDENTIFIER, id);
    }

    @Override
    public void enterUniqueName(String uniqueName) {
        waitTypeAndTabWithLabel(Constants.LBL_UNIQUE_NAME, uniqueName);
    }

    @Override
    public void enterEnglishLabel(String label) {
        waitTypeAndTabWithLabel(Constants.LBL_LABEL, label);
    }

    @Override
    public void selectOwner(String owner) {
        inputDDLThenTab(Constants.LBL_OWNER, owner);
    }

    @Override
    public void inputFieldContent(String col, String cell, String dataType) {
        waitForAllLoadingCompleted();
        switch (dataType) {
            case "TXT":
                waitTypeAndTabWithLabel(col, cell);
                break;
            case "DDL":
                inputDDLThenEnter(col, cell);
                break;
            case "RADIO":
                selectRadioBoxGroup(col, cell);
                break;
            case "DATE":
                inputDateTime(col, cell);
                break;
        }
    }

    @Override
    public void clickProfile() {
        clickOnElement("//input[@type='text' and @value='[not defined]']");
    }

    @Override
    public void chooseProfile() {
        clickOnElement("//div[@id=\"ebx_ISS_Results\"]/div[contains(text(),'(admin)')]");
    }

    @Override
    public void inputDDLWithLabel(String label, String value) {
        inputDDLThenTab(label, value);
    }

    @Override
    public void selectRadioBoxWithLabel(String label, String value) {
        selectRadioBoxGroup(label, value);
    }

    @Override
    public void selectDDLByJS(String label, String value) {
        String xPathDDL = " //tr[contains(@class,'ebx_Field') and not(@style='display: none;')][descendant::*[.='"
                + label + "']]//button[@title='Open drop-down list']";

        String xPathValue = "//div[@id='ebx_ISS_pane' ]//div[(" + specialTextPredicates(value)
                + " and string-length(normalize-space(text())=" + value.length()
                + ")) and (contains(@id,'ebx_ISS_Item') or contains(@class,'ebx_ISS_Item'))]";
        clickOnElement(xPathDDL);
        waitForAllLoadingCompleted();
        executeJS("arguments[0].click();", xPathValue);
    }

    @Override
    public void selectDDLByJSWithIndex(String label, int index, String value) {
        String xPathDDL = "(//tr[contains(@class,'ebx_Field') and not(@style='display: none;')][descendant::*[.='"
                + label + "']]//button[@title='Open drop-down list'])[" + index + "]";

        String xPathValue = "//div[@id='ebx_ISS_pane' ]//div[(" + specialTextPredicates(value)
                + " and string-length(normalize-space(text())=" + value.length()
                + ")) and (contains(@id,'ebx_ISS_Item') or contains(@class,'ebx_ISS_Item'))]";
        clickOnElement(xPathDDL);

        executeJS("arguments[0].click();", xPathValue);
    }

    @Override
    public void clickBtnWithLabel(String label, String value) {
        String xpathBtnExpand = "//tr[contains(@class,'ebx_Field') and not(@style='display: none;')]" +
                "[descendant::*[.='" + label + "']]//button[@title='" + value + "']";
        clickOnElement(xpathBtnExpand);
    }

    @Override
    public void clearDDL(String label) {
        String xpathClearBtn = "//tr[contains(@class,'ebx_Field') and not(@style='display: none;')][descendant::*[.='" + label + "']]//button[@title='Clear field']";
        clickOnElement(xpathClearBtn);
    }

    @Override
    public String getTextErrorDataModelField() {
        String xPathValue = "//tr[descendant::*[text()='Data model']]//div[@class='ebx_Error']";
        String message = getText(xPathValue);
        return message;
    }

    @Override
    public String getTextErrorTableField() {
        String xPathValue = "//tr[descendant::*[text()='Table']]//div[@class='ebx_Error']";
        return getText(xPathValue);
    }

    @Override
    public String getTextErrorDataModelInBlock() {
        String xPathValue = "//li[descendant::*[text()='Data model']]//span";
        String message = getText(xPathValue);
        return message;
    }

    @Override
    public String getTextErrorTableInBlock() {
        // String xPathValue = "//li[descendant::*[text()='Table']]";
        String xPathValue = "//li[descendant::*[text()='Table']]//span";

        return getText(xPathValue);
    }

    @Override
    public String getErrorBlock() {
        String xpathMessage = "//span[@class='ebx_WorkspaceFormHeaderValidationMessageItem']";
        String message = getText(xpathMessage);
        return message;
    }

    @Override
    public void clickBtnExpand() {
        clickBtn("expand");
    }

    @Override
    public void inputTextWithLabel(String label, String value) {
        waitTypeAndTabWithLabel(label, value);
    }
}
