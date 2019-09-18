package com.orchestranetworks.auto.addon.steps;

import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.SessionData;
import com.orchestranetworks.auto.addon.common.pages.DatasetPage;
import com.orchestranetworks.auto.addon.pages.BasePage;
import com.orchestranetworks.auto.addon.pages.ManualMergePages;
import com.orchestranetworks.auto.addon.pages.RecordDetailPage;
import net.thucydides.core.annotations.Step;
import org.assertj.core.api.SoftAssertions;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.Assert.*;

import org.junit.Assert;

public class ManualMergeSteps {

    ManualMergePages onManualMergePages;
    DatasetPage onDatasetPage;
    RecordDetailPage recordDetailPage;
    BasePage onBasePage;


    public void verify_record_view_table(List<List<String>> expectedTbl) {
        List<List<String>> actualTbl = onManualMergePages.getTableViewWidget().getDataRecordViewTable();
        compare_record_view_tbl(expectedTbl, actualTbl);
        verify_record_view_cell_highlighted(expectedTbl);


    }

    private void verify_record_view_cell_highlighted(List<List<String>> expectedTbl) {
        List<String> expectedHeader = expectedTbl.get(0);
        for (int row = 1; row < expectedTbl.size(); row++) {
            for (int col = 0; col < expectedHeader.size(); col++) {
                String expectedCell = expectedTbl.get(row).get(col);
                boolean isHighlighted = onManualMergePages.getTableViewWidget().isCellHighlighted(row, col);
                if (expectedCell.contains("{H}")) {
                    assertTrue(isHighlighted);
                } else {
                    assertFalse(isHighlighted);
                }
            }
        }
    }

    @Step
    private void compare_record_view_tbl(List<List<String>> expectedTb, List<List<String>> actualTb) {
        SoftAssertions softAssertions = SessionData.softAssert();
        List<String> expectedHeader = expectedTb.get(0);
        List<String> actualHeader = actualTb.get(0);

        assertThat(actualTb.size()).isEqualTo(expectedTb.size()).withFailMessage("Number of rows is not equal, expected:" + expectedTb.size() + ", but was:"
                + actualTb.size());
        assertThat(expectedHeader).isEqualTo(actualHeader).withFailMessage("Number of column is not equal, expected:" + expectedHeader.size() + ", but was:"
                + actualHeader.size());

        for (int row = 0; row < expectedTb.size(); row++) {
            for (int col = 0; col < expectedHeader.size(); col++) {
                String expectedCell = expectedTb.get(row).get(col);
                String actualCell = actualTb.get(row).get(col);
                if (expectedCell.contains("- {H}")) {
                    expectedCell.replace("- {H}", "").trim();
                }
                softAssertions.assertThat(expectedCell).isEqualTo(expectedCell);
            }
        }
        softAssertions.assertAll();
    }

    @Step
    public void verify_table_preview(List<List<String>> expectedTablePreview) {
        List<List<String>> actualTablePreview = onManualMergePages.getTableViewWidget().getDataPreviewTable();
        assertEquals(expectedTablePreview, actualTablePreview);

    }

    @Step
    public void click_button_next() {
        onManualMergePages.getPreviewWidget().clickBtnNext();
    }

    @Step
    public void click_button_merge() {
        onManualMergePages.getPreviewWidget().clickBtnMerge();
    }

    @Step
    public void input_merge_policy_code() {
        onManualMergePages.switchToIFrame(Constants.IFRAME_INTERNAL_POPUP);
        recordDetailPage.getItemCreationWidget().inputTextWithRandom("Merge policy code", onBasePage.getRandomString());
    }

    @Step
    public void verify_status_of_buttons(String status) {
        Assert.assertEquals(status, onManualMergePages.getTableViewWidget().isBtnCancelLastActionActive());
    }

    @Step
    public void verify_name_of_table(String tableName) {
        Assert.assertEquals(tableName, onManualMergePages.getTableViewWidget().getMergeStepsSelection());
    }

    @Step
    public void select_merge_policy_tab() {
        onManualMergePages.getRecordDetailWidget().selectMergePolicyTab();
    }

    @Step
    public void select_btn_create_record() {
        onManualMergePages.getToolbarWidget().clickBtnCreateRecordMatchAndMerge();
    }

    @Step
    public void get_text_of_reset_button() {
        onManualMergePages.getTableViewWidget().getTextOfResetBtn();
    }

    @Step
    public void verify_name_of_buttons(String name) {
        switch (name) {
            case "Reset":
                assertEquals(name, onManualMergePages.getTableViewWidget().getTextOfRightBtn());
                break;
            case "Cancel last action":
                assertEquals(name, onManualMergePages.getTableViewWidget().getTextOfCancelActionButton());
                break;
            case "Apply merge policy":
                assertEquals(name, onManualMergePages.getTableViewWidget().getTextOfRightBtn());
                break;
        }
    }

    @Step
    public void select_survivor_record(String selectionMode) {
        onManualMergePages.getItemCreationWidget().selectDDLByJS("Survivor record selection mode", selectionMode);
    }

    @Step
    public void select_default_merge_function(String defaultFunction) {
        onManualMergePages.getItemCreationWidget().inputDDLThenEnter("Default merge function", defaultFunction);
    }

    @Step
    public void use_for_merge_function(String useManualMerge) {
        onManualMergePages.getItemCreationWidget().selectRadioBoxWithLabel("Used for manual merge", useManualMerge);
    }

    @Step
    public void click_btn_save_and_close_merge_policy(){
        onManualMergePages.getFooterWidget().clickBtnSaveAndClose();
    }
}
