package com.orchestranetworks.auto.addon.widget.workspace;

import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.XFormat;

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

        String xPathValue = "//div[@id='ebx_ISS_pane' ]//div[(" + sSpecialTextPredicates(value)
                + " and string-length(normalize-space(text())=" + value.length()
                + ")) and (contains(@id,'ebx_ISS_Item') or contains(@class,'ebx_ISS_Item'))]";
        clickOnElement(xPathDDL);

        executeJS("arguments[0].click();", xPathValue);
    }

    @Override
    public String getTextErrorDataModelField() {
        String xPathValue = "(//div[@class='ebx_Error'])[1]";
        String message = getText(xPathValue);
        return message;
    }

    @Override
    public String getTextErrorTableField() {
        String xPathValue = "(//div[@class='ebx_Error'])[2]";
        return getText(xPathValue);
    }

    @Override
    public String getTextErrorDataModelInBlock() {
        String xPathValue = "(//span[@class='ebx_WorkspaceFormHeaderValidationMessageItem'])[1]";
        String message = getText(xPathValue);
        return message;
    }

    @Override
    public String getTextErrorTableInBlock() {
        String xPathValue = "(//span[@class='ebx_WorkspaceFormHeaderValidationMessageItem'])[2]";
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
