package com.orchestranetworks.auto.addon.widget.metadata;

import java.util.ArrayList;
import java.util.List;

import com.orchestranetworks.auto.addon.utils.Constants;
import org.openqa.selenium.support.pagefactory.ElementLocator;

import com.orchestranetworks.auto.addon.base.BaseWidgetImpl;

import net.serenitybdd.core.pages.PageObject;

public class MetadataWidgetImpl extends BaseWidgetImpl implements MetadataWidget {

    public MetadataWidgetImpl(PageObject page, ElementLocator locator, long timeoutInMilliseconds) {
        super(page, locator, timeoutInMilliseconds);
    }

    private static final String XPATH_MAIN_TAB = "//em[.='Main']";
    private static final String XPATH_EXECUTION_TAB = "//em[.='Execution log']";
    private static final String XPATH_TABs = "(//ul[@id='ebx_WorkspaceFormTabviewTabs']//em)";
    private static final String XPATH_LABEL_METADATA = "(//td[@class='ebx_Label'])";
    private static final String XPATH_VALUE_METADATA = "(//td[@class='ebx_Input'])";
    private static final String XPATH_PREVIEW_RECORD = "(//button[@class='ebx_FlatButton ebx_IconButton ebx_Open']/span)[1]";
    private static final String XPATH_PREVIEW_GROUP = "(//button[@class='ebx_FlatButton ebx_IconButton ebx_Open']/span)[2]";

    private static final String XPATH_BTN_CLOSE = "(//div[@class='ebx_ActionsBack']/button)[5]";
    private static final String XPATH_HEADER_GROUP = "//h2/span[contains(text(),'Manage group')]";
    private static final String XPATH_HEADER_METADATA = "//h2/span[contains(text(),'Metadata')]";
    private static final String XPATH_AUTOCREATED_RECORD = "//p[@class='information']";
    private static final String XPATH_RECORD = "//div[@id='ebx_WorkspaceContent']//tr/td/div[contains(text(),'8')]";

    @Override
    public boolean isMainSelected() {
        boolean isSelected = !getElement(XPATH_MAIN_TAB).getCssValue("border-bottom-color").equals("rgba(0, 0, 0, 0)");
        // boolean isSelected2 =
        // getElement(XPATH_MAIN_TAB+"/ancestor::li").getAttribute("title").equals("active");
        return isSelected;
    }

    @Override
    public List<String> getListTab() {
        int numOfTabs = findAllElements(XPATH_TABs).size();
        List<String> listTab = new ArrayList<String>();
        System.out.println("list" + listTab);
        for (int i = 1; i <= numOfTabs; i++) {
            listTab.add(getText(XPATH_TABs + "[" + i + "]"));
        }
        return listTab;
    }

    @Override
    public List<List<String>> getMetadataRecordView() {
        List<List<String>> metadataRecordView = new ArrayList<List<String>>();
        int numOfHeaders = findAllElements(XPATH_LABEL_METADATA).size();
        List<String> rowLabel = new ArrayList<String>();
        for (int i = 1; i <= numOfHeaders; i++) {
            String cell = getText(XPATH_LABEL_METADATA + "[" + i + "]").trim();
            rowLabel.add(cell);
            System.out.println("Cell: " + cell);
        }
        metadataRecordView.add(rowLabel);

        List<String> rowValue = new ArrayList<String>();
        System.out.println("Table: " + metadataRecordView);
        for (int j = 1; j <= numOfHeaders; j++) {
            String cell = getText(XPATH_VALUE_METADATA + "[" + j + "]")
                    .replaceAll("\\*", "")
                    .replaceAll("\n", "")
                    .trim();
            rowValue.add(cell);
        }
        metadataRecordView.add(rowValue);
        return metadataRecordView;

    }

    @Override
    public void clickBtnPreviewRecord() {
        clickOnElement(XPATH_PREVIEW_RECORD);
        switchOutDefaultIFrame();
        switchToIFrame(Constants.IFRAME_LEGACY);
        switchToIFrame(Constants.IFRAME_INTERNAL_POPUP);

    }

    @Override
    public List<List<String>> getDataRecordDetail() {
        List<List<String>> dataRecordDetail = new ArrayList<List<String>>();
        List<String> rowValueRecord = new ArrayList<String>();
        int numOfHeaders = findAllElements(XPATH_LABEL_METADATA).size();
        List<String> rowLabelRecord = new ArrayList<String>();
        for (int i = 1; i <= numOfHeaders; i++) {
            String cell = getText(XPATH_LABEL_METADATA + "[" + i + "]").trim();
            rowLabelRecord.add(cell);
        }
        dataRecordDetail.add(rowLabelRecord);

        for (int i = 1; i <= numOfHeaders; i++) {
            String cell = getText(XPATH_VALUE_METADATA + "[" + i + "]").trim();
            rowValueRecord.add(cell);
        }
        dataRecordDetail.add(rowValueRecord);

        return dataRecordDetail;
    }

    @Override
    public void clickBtnClose() {
        clickOnElement(XPATH_BTN_CLOSE);

    }

    @Override
    public void clickBtnPreviewGroup() {
        switchOutDefaultIFrame();
        switchToIFrame(Constants.IFRAME_LEGACY);
        switchToIFrame(Constants.IFRAME_SERVICE);
        clickOnElement(XPATH_PREVIEW_GROUP);
    }

    @Override
    public String getHeaderManageGroup() {
        switchOutDefaultIFrame();
        return getText(XPATH_HEADER_GROUP);
    }

    @Override
    public String getHeaderMetadata() {
        switchOutDefaultIFrame();
        return getText(XPATH_HEADER_METADATA);
    }

    @Override
    public String getTextAutoCreatedRecord() {
        return getTextValue(XPATH_AUTOCREATED_RECORD);
    }

    @Override
    public void doubleClick() {
        doubleClickByJS(XPATH_RECORD);
        waitForAllLoadingCompleted();
    }
}
