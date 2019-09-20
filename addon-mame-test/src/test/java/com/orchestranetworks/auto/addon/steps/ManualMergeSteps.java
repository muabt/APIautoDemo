package com.orchestranetworks.auto.addon.steps;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.List;

import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.SessionData;
import com.orchestranetworks.auto.addon.pages.CommonPage;
import com.orchestranetworks.auto.addon.pages.DefaultViewPage;
import com.orchestranetworks.auto.addon.pages.ManualMergePages;
import com.orchestranetworks.auto.addon.pages.RecordDetailPage;
import net.serenitybdd.core.Serenity;
import net.thucydides.core.annotations.Step;
import org.assertj.core.api.SoftAssertions;

import org.junit.Assert;

public class ManualMergeSteps {

    ManualMergePages onManualMergePages;
    DefaultViewPage onDefaultViewPage;
    RecordDetailPage recordDetailPage;
    CommonPage onCommonPage;


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
        assertThat(expectedHeader).isEqualTo(actualHeader).withFailMessage("Number of column is not equal, expected:" + expectedHeader + ", but was:"
                + actualHeader);

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
    public void input_merge_policy_code(String code) {
        onManualMergePages.switchToIFrame(Constants.IFRAME_INTERNAL_POPUP);
        String inputCode = code.equals("RANDOM") ? onCommonPage.getRandomString() : code;
        Serenity.setSessionVariable("merge_policy_code").to(inputCode);
        recordDetailPage.getItemCreationWidget().inputTextWith("Merge policy code", inputCode);
    }

    @Step
    public void input_matching_process_code(String code) {
        onManualMergePages.switchToIFrame(Constants.IFRAME_INTERNAL_POPUP);
        String inputCode = code.equals("RANDOM") ? onCommonPage.getRandomString() : code;
        recordDetailPage.getItemCreationWidget().inputTextWith("Matching process code", inputCode);
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
        onManualMergePages.getRecordDetailWidget().selectTab("Merge policy");
    }

    @Step
    public void select_btn_create_record(int index) {
        onManualMergePages.getToolbarWidget().clickBtnCreateRecordMatchAndMerge(index);
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

    public void verify_group_id(int rowInd) {
        String expected = onDefaultViewPage.getDefaultViewWidget().get_text_data_cell(1, "groupId");
        String actual = onDefaultViewPage.getDefaultViewWidget().get_text_data_cell(rowInd, "groupId");
        assertThat(actual).isEqualTo(expected);
    }

    @Step
    public void
    select_survivor_record(String selectionMode) {
        onManualMergePages.getItemCreationWidget().selectDDLByJS("Survivor record selection mode", selectionMode);
    }

    @Step
    public void select_default_merge_function(String defaultFunction) {
        onManualMergePages.getItemCreationWidget().selectDDLByJS("Default merge function", defaultFunction);
    }

    @Step
    public void use_for_merge_function(String useManualMerge) {
        onManualMergePages.getItemCreationWidget().selectRadioBoxWithLabel("Used for manual merge", useManualMerge);
    }

    @Step
    public void click_btn_save() {
        onManualMergePages.getFooterWidget().clickBtnSave();
    }

    @Step
    public void click_btn_save_and_close_internal_popup(int numberOfPopup) {
        for (int i = 0; i < numberOfPopup; i++) {
            onManualMergePages.getFooterWidget().clickBtnSaveAndCloseInInternalPopup();
            onManualMergePages.switchOutDefaultIFrame();
            onManualMergePages.switchToIFrame(Constants.IFRAME_LEGACY);
            for (int j = 0; j < numberOfPopup - i; j++) {
                onManualMergePages.switchToIFrame(Constants.IFRAME_INTERNAL_POPUP);
            }
        }
    }

    @Step
    public void click_btn_save_and_close() {
        onManualMergePages.switchToIFrame(Constants.IFRAME_LEGACY);
        onManualMergePages.getFooterWidget().clickBtnSaveAndClose();
    }

    @Step
    public void select_survivor_field_tab() {
        onManualMergePages.switchToIFrame(Constants.IFRAME_INTERNAL_POPUP);
        onManualMergePages.getRecordDetailWidget().selectTab("Survivor field");
    }

    @Step
    public void input_survivor_code() {
        recordDetailPage.getItemCreationWidget().inputTextWith("Survivorship field code", onCommonPage.getRandomString());
    }

    @Step
    public void select_field_survivor(String field) {
        recordDetailPage.getItemCreationWidget().selectDDLByJS("Field", field);
    }

    @Step
    public void select_merge_function_for_field(String mergeFunction) {
        recordDetailPage.getItemCreationWidget().selectDDLByJS("Merge function", mergeFunction);
    }

    @Step
    public void input_condition(String condition) {

    }

    @Step
    public void select_execute_option(String executeEmpty) {
        recordDetailPage.getItemCreationWidget().selectRadioBoxWithLabel("Execute only if empty", executeEmpty);
    }

    public void select_matching_process_tab() {
        onManualMergePages.getRecordDetailWidget().selectTab("Matching process");
    }

    public void selectActive(String active) {
        onManualMergePages.getRecordDetailWidget().selectRadioButton("Active", active);
    }

    public void select_matching_execution_on_creation(String matchingExecutionOnCreation) {
        onManualMergePages.getItemCreationWidget().selectDDLByJS("Matching execution on creation", matchingExecutionOnCreation);
    }

    public void select_matching_excution_on_update(String matchingExecutionOnUpdate) {
        onManualMergePages.getItemCreationWidget().selectDDLByJS("Matching execution on update", matchingExecutionOnUpdate);
    }

    public void select_merge_policy_record(String record) {
        onManualMergePages.getDefaultview().accessRecordWithText(record);
    }
}
