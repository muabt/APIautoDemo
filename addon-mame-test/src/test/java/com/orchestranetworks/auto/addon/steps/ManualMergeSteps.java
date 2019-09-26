package com.orchestranetworks.auto.addon.steps;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.List;

import com.google.gson.JsonObject;
import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.utils.MAMEConstants;
import com.orchestranetworks.auto.addon.SessionData;
import com.orchestranetworks.auto.addon.pages.CommonPage;
import com.orchestranetworks.auto.addon.pages.DefaultViewPage;
import com.orchestranetworks.auto.addon.pages.ManualMergePage;
import com.orchestranetworks.auto.addon.pages.RecordDetailPage;
import com.orchestranetworks.auto.addon.utils.TechnicalTable;
import net.serenitybdd.core.Serenity;
import net.thucydides.core.annotations.Step;
import org.assertj.core.api.SoftAssertions;

import org.junit.Assert;

public class ManualMergeSteps {

    ManualMergePage onManualMergePage;
    DefaultViewPage onDefaultViewPage;
    RecordDetailPage recordDetailPage;
    CommonPage onCommonPage;

    @Step
    public void verify_record_view_table(List<List<String>> expectedTbl) {
        List<List<String>> actualTbl = onManualMergePage.getTableViewWidget().getDataRecordViewTable();
        compare_record_view_tbl(expectedTbl, actualTbl);
        verify_record_view_cell_highlighted(expectedTbl);
    }

    private void verify_record_view_cell_highlighted(List<List<String>> expectedTbl) {
        List<String> expectedHeader = expectedTbl.get(0);
        for (int row = 1; row < expectedTbl.size(); row++) {
            for (int col = 0; col < expectedHeader.size(); col++) {
                String expectedCell = expectedTbl.get(row).get(col);
                boolean isHighlighted = onManualMergePage.getTableViewWidget().isCellHighlighted(row, col);
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
        List<List<String>> actualTablePreview = onManualMergePage.getTableViewWidget().getDataPreviewTable();
        assertEquals(expectedTablePreview, actualTablePreview);

    }

    @Step
    public void click_button_next() {
        onManualMergePage.getPreviewWidget().clickBtnNext();
    }

    @Step
    public void click_button_merge() {
        onManualMergePage.getPreviewWidget().clickBtnMerge();
    }

    @Step
    public void input_merge_policy_code(String code) {
        onManualMergePage.switchToIFrame(Constants.IFRAME_INTERNAL_POPUP);
        String inputCode = code.equals("RANDOM") ? onCommonPage.getRandomString() : code;
        Serenity.setSessionVariable(MAMEConstants.MERGE_POLICY_CODE).to(inputCode);
        recordDetailPage.getItemCreationWidget().inputTextWithLabel("Merge policy code", inputCode);
    }

    @Step
    public void input_matching_process_code(String code) {
        onManualMergePage.switchToIFrame(Constants.IFRAME_INTERNAL_POPUP);
        String inputCode = code.equals("RANDOM") ? onCommonPage.getRandomString() : code;
        recordDetailPage.getItemCreationWidget().inputTextWithLabel("Matching process code", inputCode);
        SessionData.saveValueToSession(MAMEConstants.MATCHING_POLICY_CODE_KEY, inputCode);
    }

    @Step
    public void verify_status_of_buttons(String status) {
        assertThat(status).isEqualTo(onManualMergePage.getTableViewWidget().isBtnCancelLastActionActive());
    }

    @Step
    public void verify_name_of_table(String tableName) {
        Assert.assertEquals(tableName, onManualMergePage.getTableViewWidget().getMergeStepsSelection());
    }

    @Step
    public void select_merge_policy_tab() {
        onManualMergePage.getRecordDetailWidget().selectTab("Merge policy");
    }

    @Step
    public void select_btn_create_record(int index) {
        onManualMergePage.getToolbarWidget().clickBtnCreateRecordMatchAndMerge(index);
    }

    @Step
    public void verify_name_of_buttons(String name) {
        switch (name) {
            case "Reset":
            case "Apply merge policy":
                assertEquals(name, onManualMergePage.getTableViewWidget().getTextOfRightBtn());
                break;
            case "Cancel last action":
                assertEquals(name, onManualMergePage.getTableViewWidget().getTextOfCancelActionButton());
                break;
        }
    }

    @Step
    public void verify_group_id(int rowInd) {
        String expected = SessionData.getJsonTableValue(MAMEConstants.RECORD_METADATA_TBL,0, "groupId");
        String actual = SessionData.getJsonTableValue(MAMEConstants.RECORD_METADATA_TBL,rowInd, "groupId");
        assertThat(actual).isEqualTo(expected);
    }

    @Step
    public void
    select_survivor_record(String selectionMode) {
        onManualMergePage.getItemCreationWidget().selectDDLByJS("Survivor record selection mode", selectionMode);
    }

    @Step
    public void select_default_merge_function(String defaultFunction) {
        onManualMergePage.getItemCreationWidget().selectDDLByJS("Default merge function", defaultFunction);
    }

    @Step
    public void use_for_merge_function(String useManualMerge) {
        onManualMergePage.getItemCreationWidget().selectRadioBoxWithLabel("Used for manual merge", useManualMerge);
    }

    @Step
    public void click_btn_save() {
        onManualMergePage.getFooterWidget().clickBtnSave();
    }

    @Step
    public void click_btn_save_and_close_internal_popup(int numberOfPopup) {
        for (int i = 0; i < numberOfPopup; i++) {
            onManualMergePage.getFooterWidget().clickBtnSaveAndCloseInInternalPopup();
            onManualMergePage.switchOutDefaultIFrame();
            onManualMergePage.switchToIFrame(Constants.IFRAME_LEGACY);
            for (int j = 0; j < numberOfPopup - i; j++) {
                onManualMergePage.switchToIFrame(Constants.IFRAME_INTERNAL_POPUP);
            }
        }
    }

    @Step
    public void click_btn_save_and_close() {
        onManualMergePage.switchToIFrame(Constants.IFRAME_LEGACY);
        onManualMergePage.getFooterWidget().clickBtnSaveAndClose();
    }

    @Step
    public void select_survivor_field_tab() {
        onManualMergePage.switchToIFrame(Constants.IFRAME_INTERNAL_POPUP);
        onManualMergePage.getRecordDetailWidget().selectTab("Survivor field");
    }

    @Step
    public void input_survivor_code(String code) {
        String inputCode = code.equals("RANDOM") ? onCommonPage.getRandomString() : code;
        recordDetailPage.getItemCreationWidget().inputTextWithLabel("Survivorship field code", inputCode);
        SessionData.saveValueToSession(MAMEConstants.MATCHING_POLICY_CODE_KEY, inputCode);
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

    @Step
    public void select_matching_process_tab() {
        onManualMergePage.getRecordDetailWidget().selectTab("Matching process");
    }

    @Step
    public void selectActive(String active) {
        onManualMergePage.getRecordDetailWidget().selectRadioButton("Active", active);
    }

    @Step
    public void select_matching_execution_on_creation(String matchingExecutionOnCreation) {
        onManualMergePage.getItemCreationWidget().selectDDLByJS("Matching execution on creation", matchingExecutionOnCreation);
    }

    @Step
    public void select_matching_excution_on_update(String matchingExecutionOnUpdate) {
        onManualMergePage.getItemCreationWidget().selectDDLByJS("Matching execution on update", matchingExecutionOnUpdate);
    }

    @Step
    public void select_merge_policy_record(String record) {
        onManualMergePage.getDefaultview().accessRecordWithText(record);
    }

    @Step
    public void input_name_of_source(String nameOfSource) {
        String inputCode = nameOfSource.equals("RANDOM") ? onCommonPage.getRandomString() : nameOfSource;
        Serenity.setSessionVariable(MAMEConstants.NAME_OF_SOURCE).to(inputCode);
        recordDetailPage.getItemCreationWidget().inputTextWithLabel("Name of source", inputCode);
    }

    @Step
    public void input_description(String description) {
        recordDetailPage.getItemCreationWidget().inputTextWithLabel("Description", description);
    }

    @Step
    public void select_matching_table(String matchingTable) {
        Serenity.setSessionVariable(MAMEConstants.MATCHING_TABLE).to(matchingTable);
        recordDetailPage.getItemCreationWidget().selectDDLByJS("Matching table", matchingTable);
    }

    @Step
    public void add_trusted_source_list(String trustedSourceList) {
        String[] sourceList = trustedSourceList.split(",");
        for (int i = 0; i < sourceList.length; i++) {
            recordDetailPage.getRecordDetailWidget().addAnOccurrence();
            recordDetailPage.getItemCreationWidget().selectDDLByJS("Trusted source list", sourceList[i].trim());
        }
    }

    @Step
    public void select_field_trusted_source(String field) {
        recordDetailPage.getItemCreationWidget().selectDDLByJS("Field", field);
    }

    @Step
    public void select_merge_policy(String mergePolicy) {
        recordDetailPage.getItemCreationWidget().selectDDLByJS("Merge policy", mergePolicy);
    }

    @Step
    public void select_auto_create_new_golden_mode(String autoCreateNewGolden) {
        onManualMergePage.getItemCreationWidget().selectDDLByJS("Mode", autoCreateNewGolden);
    }

    @Step
    public void select_record_with_label(String mergePolicyCode) {
        Serenity.setSessionVariable(MAMEConstants.MERGE_POLICY_CODE).to(mergePolicyCode);
        onManualMergePage.getDefaultview().accessRecordWithText(mergePolicyCode);
        onManualMergePage.switchToIFrame(Constants.IFRAME_INTERNAL_POPUP);
    }

    @Step
    public boolean verify_code_existed(String mergePolicyCode) {
        return onManualMergePage.getAdministrationWidget().verifyCodeExisted(mergePolicyCode);
    }

    @Step
    public void apply_permission_on_merge_view(String applyPermission) {
        onManualMergePage.getItemCreationWidget().selectRadioBoxWithLabel("Apply permission on merge view", applyPermission);
    }
    @Step
    public JsonObject getRecordTable(String recordID, List<String> headerList) {
        return onDefaultViewPage.getDefaultViewWidget().getRecordWithPK(recordID, headerList);
    }
    @Step
    public String getMergingProcessID(String groupID) {
        return "";
    }


    @Step
    public void close_error_popup() {
        onManualMergePage.switchOutDefaultIFrame();
        onManualMergePage.getPopupWidget().clickBtnClose();
        onManualMergePage.switchToIFrame(Constants.IFRAME_LEGACY);
    }

    @Step
    public void select_checkbox_with_text(String label) {
        onManualMergePage.getDefaultview().selectCheckboxWithText(label);
    }

    @Step
    public void select_table_service(String service) {
        onManualMergePage.getToolbarWidget().clickBtnActions().selectService(service);
    }

    @Step
    public void confirm_popup() {
        onManualMergePage.getPopupWidget().confirmOK();
    }

    public void clear_default_merge_function() {
        onManualMergePage.getItemCreationWidget().clearDDL("Default merge function");
    }
}
