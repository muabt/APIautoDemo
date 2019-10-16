package com.orchestranetworks.auto.addon.widget.workspace;

import com.orchestranetworks.auto.addon.utils.XFormat;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

import java.util.ArrayList;
import java.util.List;

public class RecordDetailWidgetImpl extends BaseWidgetImpl implements RecordDetailWidget {

    private static final String MERGE_POLICY_TAB = "//ul[@id='ebx_WorkspaceFormTabviewTabs']//span[text()='%s']/ancestor::li";
    private static final String XPATH_LABEL = "(//tr[not(td[@class='ebx_FieldExpandCollapse'])]/td[@class='ebx_Label'])";
    private static final String XPATH_LABEL_OF_FIELD = "(//td[@class='ebx_Label' and not(contains(.,'FieldExpandCollapse'))]//label[text()='%s'])";
    private static final String XPATH_VALUE = "(//td[@class='ebx_Input']//input[(@value and @type='text')]|//td[@class='ebx_Input']//input[(@type='radio' and @checked='checked')]/parent::*)";
    private static final String XPATH_TOOLTIP_CONTENT = "//div[@class='ebx_dcpTitle'and text()='%s']/following-sibling::div[@class='ebx_dcpDescription']";
    private static final String XPATH_TOOLTIP = "//*[text()='%s']/ancestor::tr//*[@title='Show details']";

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
        waitAbit(500);
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

    public List<List<String>> getRecordDetail() {
        List<List<String>> metadataRecordView = new ArrayList<List<String>>();
        int numOfHeaders = findAllElements(XPATH_LABEL).size();
        List<String> rowLabel = new ArrayList<String>();
        for (int i = 1; i <= numOfHeaders; i++) {
            String cell = getText(XPATH_LABEL + "[" + i + "]").trim();
            rowLabel.add(cell);
        }
        metadataRecordView.add(rowLabel);

        List<String> rowValue = new ArrayList<String>();
        for (int j = 1; j <= numOfHeaders; j++) {
            String cell = "";
            if (isElementExistNow(XPATH_VALUE + "[" + j + "]")) {
                cell = getElement(XPATH_VALUE + "[" + j + "]").getTextValue().trim();
                rowValue.add(cell);
            }
        }
        metadataRecordView.add(rowValue);
        return metadataRecordView;
    }


    @Override
    public void viewRecordWithText(String label) {
        String xPath = "(//table[@class='ebx_tvMain']//td[text()='" + label + "'])";
        doubleClickByJS(xPath);
    }

    @Override
    public String getTooltip(String field) {
        return getTextValue(XFormat.of(XPATH_TOOLTIP_CONTENT, field)).replaceAll("\n", "").trim();
    }

    @Override
    public void viewRecordWithTextWithDecorator(String label) {
        String xPath = "//table[@class='ebx_tvMain']//td/div[text()='" + label + "']";
        waitAbit(500);
        doubleClickByJS(xPath);
    }


    @Override
    public void clickShowDetailTooltip(String field) {
        clickByJS(XFormat.of(XPATH_TOOLTIP, field));
    }

    @Override
    public void closeTooltipOfField(String field) {
        waitAbit(500);
        clickOnElement("//div[@class='ebx_dcpDescription']");
    }

    @Override
    public void clickBtnPreview() {
        String xPath = "//span[@class='ebx_Icon']/ancestor::button[@title='Preview']";
        clickOnElement(xPath);
    }
}
