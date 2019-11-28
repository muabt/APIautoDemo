package com.orchestranetworks.auto.addon.widget.workspace;

import com.orchestranetworks.auto.addon.utils.Constants;

import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

import javax.xml.bind.Element;
import java.util.ArrayList;
import java.util.List;

public class ItemCreationWidgetImpl extends BaseWidgetImpl implements ItemCreationWidget {

    private static final String XPATH_DATETIME = "//label[text()='%s']/ancestor::tr//span//input[contains(@name,'%s')]";
    private static final String XPATH_VALIDATION_MSG = "//tr[descendant::label[.='%s']]//div[@class='ebx_Error']";
    private static final String XPATH_HEADER = "(//th[contains(@id,'ebx_workspaceTable_tableField') or (@class='ebx_tvSortableColumn')][descendant::span[@class='ebx_RawLabel']])";
    private static final String XPATH_ROW = "//div[@id='ebx_workspaceTable_fixedScroller']//table[@class='ebx_tvFixed']/tbody/tr[child::td[not(@class) and not(contains(@style,'hidden'))]]";

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
            case "GROUP":
                pressCtrlToSelect(col, cell);
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
    public void pressCtrlToSelect(String label, String values) {
        String xPath = "//descendant-or-self::*[@name='___40_xtusd_5f_DashboardCreation__shareWith']";
        getElement(xPath).sendKeys(Keys.CONTROL);
        String[] valuesList= values.split(",");
        for (int i = 0; i < valuesList.length; i++) {
            String xpathE = "//select/option[contains(.,'"+valuesList[i]+"')]";
            scrollElementIntoView(xpathE);
            clickOnElement(xpathE);
//            int nextElementIndex = i + 1;
//            if (nextElementIndex < valuesList.length) {
//                String nextXPathElement = "//select/option[contains(.,'"+valuesList[nextElementIndex]+"')]";
//                srollToNextElement(nextXPathElement);
//            }
        }
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

    @Override
    public String getTextValidationMessage(String fieldName) {
        return getText(String.format(XPATH_VALIDATION_MSG, fieldName));
    }

    @Override
    public void expandAll() {
        int size = findAllElements(xPathBtn("expand")).size();
        for (int i = 1; i <= size; i++) {
            clickBtn("expand", i);
        }
    }

    @Override
    public List<List<String>> getBusinessDataTable() {
        waitForAllLoadingCompleted();
        List<String> row = new ArrayList<String>();
        List<List<String>> actualBusinessTbl = new ArrayList<List<String>>();
        int numOfHeader = findAllElements(XPATH_HEADER).size();
        for (int i = 1; i <= numOfHeader; i++) {
            String xPathHeaderCell = XPATH_HEADER + "[" + i + "]";
            row.add(getTextCell(xPathHeaderCell));
            actualBusinessTbl.add(row);
            int numOfRow = findAllElements(XPATH_ROW).size();
            for (int rowind = 1; rowind <= numOfRow; rowind++) {
                row = new ArrayList<String>();
                for (int colInd = 1; colInd <= numOfHeader; colInd++) {
                    String xPahtCell = "((//div[@id='ebx_workspaceTable_container']//tr[contains(@class,'ebx')][" + rowind
                            + "]//td[not(*) and not(@class='ebx_tvInheritanceCell'  or @class='ebx_tvSelectCell') ]) | (//div[@id='ebx_workspaceTable_container']//tr[contains(@class,'ebx')]["
                            + rowind
                            + "]//td[child::div[not(*) and not(@class='ebx_tvInheritanceCell'  or @class='ebx_tvSelectCell') ]]))["
                            + colInd + "]";
                    xPahtCell = String.format(xPahtCell, rowind, colInd);
                    row.add(getTextCell(xPahtCell));
                }
                actualBusinessTbl.add(row);
            }
        }
        return actualBusinessTbl;
    }

    private String getTextCell(String xPathCell) {
        try {
            if (!getElement(xPathCell).isDisplayed()) {
                return getElement(xPathCell).getAttribute("textContent").replaceAll("\n", "").trim();
            } else {
                return getText(xPathCell).replaceAll("\n", "");
            }
        } catch (Exception e) {
            return "";
        }
    }




}