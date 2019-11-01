package com.orchestranetworks.auto.addon.steps.config;

import com.orchestranetworks.auto.addon.pages.CommonPage;
import com.orchestranetworks.auto.addon.utils.Constants;
import com.orchestranetworks.auto.addon.pages.config.MatchingTablePage;
import com.orchestranetworks.auto.addon.pages.RecordDetailPage;
import com.orchestranetworks.auto.addon.utils.MAMEConstants;
import com.orchestranetworks.auto.addon.utils.SessionData;
import net.serenitybdd.core.Serenity;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.steps.ScenarioSteps;
import org.junit.Assert;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;


public class MatchingTableSteps extends ScenarioSteps {

    MatchingTablePage onMatchingTablePage;
    CommonPage onCommonPage;

    @Step
    public void verify_error_message_data_model_field(String message) {
        Assert.assertEquals(message, onMatchingTablePage.getItemCreationWidget().getTextErrorDataModelField());
    }

    @Step
    public void verify_error_message_table_field(String message) {
        Assert.assertEquals(message, onMatchingTablePage.getItemCreationWidget().getTextErrorTableField());
    }

    @Step
    public void verify_error_message_data_model_in_block(String message) {
        Assert.assertEquals(message, onMatchingTablePage.getItemCreationWidget().getTextErrorDataModelInBlock());
    }

    @Step
    public void verify_error_message_table_in_block(String message) {
        Assert.assertEquals(message, onMatchingTablePage.getItemCreationWidget().getTextErrorTableInBlock());
    }

    @Step
    public void click_btn_expand() {
        onMatchingTablePage.getItemCreationWidget().clickBtnExpand();
    }

    @Step
    public void verify_record_detail(List<List<String>> getrecordDetail) {
        List<List<String>> recordDetails = onMatchingTablePage.getRecordDetailWidget().getRecordDetail();
        assertThat(recordDetails).isEqualTo(getrecordDetail);
    }

    @Step
    public void verify_matching_process_detail(List<List<String>> getrecordDetail) {
        onMatchingTablePage.switchToIFrame(Constants.IFRAME_INTERNAL_POPUP);
        List<List<String>> recordDetails = onMatchingTablePage.getRecordDetailWidget().getRecordDetail();
        assertThat(recordDetails).isEqualTo(getrecordDetail);
    }

    @Step
    public void verify_tooltip_of_field(String field, String tooltip) {
        onMatchingTablePage.getRecordDetailWidget().clickShowDetailTooltip(field);
        String tooltips = onMatchingTablePage.getRecordDetailWidget().getTooltip(field);
        assertThat(tooltips).isEqualTo(tooltip);
        onMatchingTablePage.getRecordDetailWidget().closeTooltipOfField(field);
    }

    @Step
    public void click_btn_preview() {
        onMatchingTablePage.getRecordDetailWidget().clickBtnPreview();
    }

    @Step
    public void select_matching_process_tab() {
        onMatchingTablePage.getRecordDetailWidget().selectTab(MAMEConstants.MATCHING_PROCESS);
    }

    @Step
    public boolean verify_code_existed(String mergePolicyCode) {
        return onMatchingTablePage.getDefaultViewWidget().isRecordWithPKExisted(mergePolicyCode);
    }

    @Step
    public void select_record_with_label(String mergePolicyCode) {
        Serenity.setSessionVariable(MAMEConstants.MERGE_POLICY_CODE).to(mergePolicyCode);
        onMatchingTablePage.getDefaultViewWidget().accessRecordWithText(mergePolicyCode);
        onMatchingTablePage.switchToIFrame(Constants.IFRAME_INTERNAL_POPUP);
    }

    @Step
    public void select_btn_create_record(int index) {
        onMatchingTablePage.getToolbarWidget().clickBtnCreateRecordMatchAndMerge(index);
    }

    @Step
    public void input_matching_process_code(String code) {
        onMatchingTablePage.switchToIFrame(Constants.IFRAME_INTERNAL_POPUP);
        String inputCode = code.equals(Constants.RANDOM) ? onCommonPage.getRandomString() : code;
        onMatchingTablePage.getItemCreationWidget().inputTextWithLabel(MAMEConstants.MATCHING_PROCESS_CODE, inputCode);
        SessionData.saveValueToSession(MAMEConstants.MATCHING_POLICY_CODE_KEY, inputCode);
    }

    @Step
    public void selectActive(String active) {
        onMatchingTablePage.getRecordDetailWidget().selectRadioButton(MAMEConstants.ACTIVE, active);
    }

    @Step
    public void select_matching_execution_on_creation(String matchingExecutionOnCreation) {
        onMatchingTablePage.getItemCreationWidget().selectDDLByJS(MAMEConstants.MATCHING_EXECUTION_ON_CREATION, matchingExecutionOnCreation);
    }

    @Step
    public void select_matching_excution_on_update(String matchingExecutionOnUpdate) {
        onMatchingTablePage.getItemCreationWidget().selectDDLByJS(MAMEConstants.MATCHING_EXECUTION_ON_UPDATE, matchingExecutionOnUpdate);
    }

    @Step
    public void select_merge_policy(String mergePolicy) {
        onMatchingTablePage.getItemCreationWidget().selectDDLByJS(MAMEConstants.MERGE_POLICY_TAB, mergePolicy);
    }

    @Step
    public void click_btn_save_and_close_internal_popup(int numberOfPopup) {
        for (int i = 0; i < numberOfPopup; i++) {
            onMatchingTablePage.getFooterWidget().clickBtnSaveAndCloseInInternalPopup();
            onMatchingTablePage.switchOutDefaultIFrame();
            onMatchingTablePage.switchToIFrame(Constants.IFRAME_LEGACY);
            for (int j = 0; j < numberOfPopup - i; j++) {
                onMatchingTablePage.switchToIFrame(Constants.IFRAME_INTERNAL_POPUP);
            }
        }
    }

    @Step
    public void select_merge_policy_tab() {
        onMatchingTablePage.getRecordDetailWidget().selectTab(MAMEConstants.MERGE_POLICY_TAB);
    }

    @Step
    public void input_merge_policy_code(String code) {
        onMatchingTablePage.switchToIFrame(Constants.IFRAME_INTERNAL_POPUP);
        String inputCode = code.equals(Constants.RANDOM) ? onCommonPage.getRandomString() : code;
        Serenity.setSessionVariable(MAMEConstants.MERGE_POLICY_CODE).to(inputCode);
        onMatchingTablePage.getItemCreationWidget().inputTextWithLabel(MAMEConstants.MERGE_POLICY_CODE_FIELD, inputCode);
    }

    @Step
    public void
    select_survivor_record(String selectionMode) {
        onMatchingTablePage.getItemCreationWidget().selectDDLByJS(MAMEConstants.SURVIVOR_RECORD_SELECTION_MODE, selectionMode);
    }

    @Step
    public void select_default_merge_function(String defaultFunction) {
        onMatchingTablePage.getItemCreationWidget().selectDDLByJS(MAMEConstants.DEFAULT_MERGE_FUNCTION, defaultFunction);
    }

    @Step
    public void use_for_merge_function(String useManualMerge) {
        onMatchingTablePage.getItemCreationWidget().selectRadioBoxWithLabel(MAMEConstants.USE_MANUAL_MERGE, useManualMerge);
    }

    @Step
    public void clear_default_merge_function() {
        onMatchingTablePage.getItemCreationWidget().clearDDL(MAMEConstants.DEFAULT_MERGE_FUNCTION);
    }

    @Step
    public void select_auto_create_new_golden_mode(String autoCreateNewGolden) {
        onMatchingTablePage.getItemCreationWidget().selectDDLByJS(MAMEConstants.MODE, autoCreateNewGolden);
    }

    @Step
    public void apply_permission_on_merge_view(String applyPermission) {
        onMatchingTablePage.getItemCreationWidget().selectRadioBoxWithLabel(MAMEConstants.APPLY_PERMISSION_ON_MERGE_VIEW, applyPermission);
    }

    @Step
    public void select_merge_policy_record(String record) {
        onMatchingTablePage.getDefaultViewWidget().accessRecordWithText(record);
    }

    @Step
    public void select_survivor_field_tab() {
        onMatchingTablePage.switchToIFrame(Constants.IFRAME_INTERNAL_POPUP);
        onMatchingTablePage.getRecordDetailWidget().selectTab(MAMEConstants.SURVIVOR_FIELD);
    }

    @Step
    public void input_survivor_code(String code) {
        String inputCode = code.equals(Constants.RANDOM) ? onCommonPage.getRandomString() : code;
        onMatchingTablePage.getItemCreationWidget().inputTextWithLabel(MAMEConstants.SURVIVORSHIP_FIELD_CODE, inputCode);
        SessionData.saveValueToSession(MAMEConstants.MATCHING_POLICY_CODE_KEY, inputCode);
    }

    @Step
    public void select_field_survivor(String field) {
        onMatchingTablePage.getItemCreationWidget().selectDDLByJS(MAMEConstants.FIELD, field);
    }

    @Step
    public void select_merge_function_for_field(String mergeFunction) {
        onMatchingTablePage.getItemCreationWidget().selectDDLByJS(MAMEConstants.MERGE_FUNCTION, mergeFunction);
    }

    //TODO: Method implement later
    @Step
    public void input_condition(String condition) {

    }

    @Step
    public void select_execute_option(String executeEmpty) {
        onMatchingTablePage.getItemCreationWidget().selectRadioBoxWithLabel(MAMEConstants.EXECUTE_EMPTY, executeEmpty);
    }

    @Step
    public void click_btn_save_and_close() {
        onMatchingTablePage.switchToIFrame(Constants.IFRAME_LEGACY);
        onMatchingTablePage.getFooterWidget().clickBtnSaveAndClose();
    }

    @Step
    public void select_keep_not_matched_records_untouched(String keepNotMatchedRecordsUntouched) {
        onMatchingTablePage.getItemCreationWidget().selectRadioBoxWithLabel(MAMEConstants.KEEP_NOT_MATCH, keepNotMatchedRecordsUntouched);
    }

    @Step
    public void select_merged_record_is_recycled(String mergedRecordIsRecycled) {
        onMatchingTablePage.getItemCreationWidget().selectRadioBoxWithLabel(MAMEConstants.RECORD_RECYCLED, mergedRecordIsRecycled);
    }

    @Step
    public void select_modify_merged_without_match(String modifyMergedWithoutMatch) {
        onMatchingTablePage.getItemCreationWidget().selectRadioBoxWithLabel(MAMEConstants.MODIFY_MERGE, modifyMergedWithoutMatch);
    }

    @Step
    public void select_one_of_the_values_is_null(String oneOfTheValuesIsNull) {
        onMatchingTablePage.getItemCreationWidget().selectDDLByJS(MAMEConstants.ONE_VALUE_NULL, oneOfTheValuesIsNull);

    }

    @Step
    public void select_both_values_are_null(String bothValuesAreNull) {
        onMatchingTablePage.getItemCreationWidget().selectDDLByJS(MAMEConstants.BOTH_VALUE_ARE_NULL, bothValuesAreNull);
    }

    @Step
    public void select_record_with_pk(String[] col) {
        onMatchingTablePage.getSourceWidget().selectCheckboxWithPK(col);
    }

    public void verify_default_value(String fieldType, String field, String value) {
        String actual = "";
        switch (fieldType.toLowerCase()) {
            case "radio":
                actual = onMatchingTablePage.getMatchingProcessWidget().getValueOfRadioField(field);
                break;
            case "input":
                actual = onMatchingTablePage.getMatchingProcessWidget().getValueOfInputField(field);
                break;
            case "drop-down list":
                actual = onMatchingTablePage.getMatchingProcessWidget().getValueOfDropdownField(field);
                break;
            default:

        }

        assertThat(actual).isEqualTo(value);
    }

    public void verify_validation_message(String fieldName, String msg) {
       String actual= onMatchingTablePage.getItemCreationWidget().getTextValidationMessage(fieldName);
       assertThat(actual).isEqualTo(msg);
    }
}

