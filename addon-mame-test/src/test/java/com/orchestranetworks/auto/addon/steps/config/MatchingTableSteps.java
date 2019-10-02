package com.orchestranetworks.auto.addon.steps.config;

import com.orchestranetworks.auto.addon.pages.CommonPage;
import com.orchestranetworks.auto.addon.utils.Constants;
import com.orchestranetworks.auto.addon.pages.config.MatchingTablePage;
import com.orchestranetworks.auto.addon.pages.RecordDetailPage;
import com.orchestranetworks.auto.addon.utils.MAMEConstants;
import com.orchestranetworks.auto.addon.utils.SessionData;
import net.serenitybdd.core.Serenity;
import net.thucydides.core.annotations.Step;
import org.junit.Assert;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;


public class MatchingTableSteps {

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
        onMatchingTablePage.getItemCreationWidget().inputTextWithLabel("Matching process code", inputCode);
        SessionData.saveValueToSession(MAMEConstants.MATCHING_POLICY_CODE_KEY, inputCode);
    }

    @Step
    public void selectActive(String active) {
        onMatchingTablePage.getRecordDetailWidget().selectRadioButton("Active", active);
    }

    @Step
    public void select_matching_execution_on_creation(String matchingExecutionOnCreation) {
        onMatchingTablePage.getItemCreationWidget().selectDDLByJS("Matching execution on creation", matchingExecutionOnCreation);
    }

    @Step
    public void select_matching_excution_on_update(String matchingExecutionOnUpdate) {
        onMatchingTablePage.getItemCreationWidget().selectDDLByJS("Matching execution on update", matchingExecutionOnUpdate);
    }

    @Step
    public void select_merge_policy(String mergePolicy) {
        onMatchingTablePage.getItemCreationWidget().selectDDLByJS("Merge policy", mergePolicy);
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
        onMatchingTablePage.getRecordDetailWidget().selectTab("Merge policy");
    }

    @Step
    public void input_merge_policy_code(String code) {
        onMatchingTablePage.switchToIFrame(Constants.IFRAME_INTERNAL_POPUP);
        String inputCode = code.equals(Constants.RANDOM) ? onCommonPage.getRandomString() : code;
        Serenity.setSessionVariable(MAMEConstants.MERGE_POLICY_CODE).to(inputCode);
        onMatchingTablePage.getItemCreationWidget().inputTextWithLabel("Merge policy code", inputCode);
    }

    @Step
    public void
    select_survivor_record(String selectionMode) {
        onMatchingTablePage.getItemCreationWidget().selectDDLByJS("Survivor record selection mode", selectionMode);
    }

    @Step
    public void select_default_merge_function(String defaultFunction) {
        onMatchingTablePage.getItemCreationWidget().selectDDLByJS("Default merge function", defaultFunction);
    }

    @Step
    public void use_for_merge_function(String useManualMerge) {
        onMatchingTablePage.getItemCreationWidget().selectRadioBoxWithLabel("Used for manual merge", useManualMerge);
    }

    @Step
    public void clear_default_merge_function() {
        onMatchingTablePage.getItemCreationWidget().clearDDL("Default merge function");
    }

    @Step
    public void select_auto_create_new_golden_mode(String autoCreateNewGolden) {
        onMatchingTablePage.getItemCreationWidget().selectDDLByJS("Mode", autoCreateNewGolden);
    }

    @Step
    public void apply_permission_on_merge_view(String applyPermission) {
        onMatchingTablePage.getItemCreationWidget().selectRadioBoxWithLabel("Apply permission on merge view", applyPermission);
    }

    @Step
    public void select_merge_policy_record(String record) {
        onMatchingTablePage.getDefaultViewWidget().accessRecordWithText(record);
    }

    @Step
    public void select_survivor_field_tab() {
        onMatchingTablePage.switchToIFrame(Constants.IFRAME_INTERNAL_POPUP);
        onMatchingTablePage.getRecordDetailWidget().selectTab("Survivor field");
    }

    @Step
    public void input_survivor_code(String code) {
        String inputCode = code.equals(Constants.RANDOM) ? onCommonPage.getRandomString() : code;
        onMatchingTablePage.getItemCreationWidget().inputTextWithLabel("Survivorship field code", inputCode);
        SessionData.saveValueToSession(MAMEConstants.MATCHING_POLICY_CODE_KEY, inputCode);
    }

    @Step
    public void select_field_survivor(String field) {
        onMatchingTablePage.getItemCreationWidget().selectDDLByJS("Field", field);
    }

    @Step
    public void select_merge_function_for_field(String mergeFunction) {
        onMatchingTablePage.getItemCreationWidget().selectDDLByJS("Merge function", mergeFunction);
    }

    //TODO: Method implement later
    @Step
    public void input_condition(String condition) {

    }

    @Step
    public void select_execute_option(String executeEmpty) {
        onMatchingTablePage.getItemCreationWidget().selectRadioBoxWithLabel("Execute only if empty", executeEmpty);
    }

    @Step
    public void click_btn_save_and_close() {
        onMatchingTablePage.switchToIFrame(Constants.IFRAME_LEGACY);
        onMatchingTablePage.getFooterWidget().clickBtnSaveAndClose();
    }

    @Step
    public void select_keep_not_matched_records_untouched(String keepNotMatchedRecordsUntouched) {
        onMatchingTablePage.getMatchingProcessWidget().selectRadioBoxWithLabel("Keep not matched records untouched", keepNotMatchedRecordsUntouched);
    }

    @Step
    public void select_merged_record_is_recycled(String mergedRecordIsRecycled) {
        onMatchingTablePage.getMatchingProcessWidget().selectRadioBoxWithLabel("Merged record is recycled", mergedRecordIsRecycled);
    }

    @Step
    public void select_modify_merged_without_match(String modifyMergedWithoutMatch) {
        onMatchingTablePage.getMatchingProcessWidget().selectRadioBoxWithLabel("Modify merged without match", modifyMergedWithoutMatch);
    }

    public void select_one_of_the_values_is_null(String oneOfTheValuesIsNull) {
        onMatchingTablePage.getMatchingProcessWidget().selectDDLByJS("One of the values is null", oneOfTheValuesIsNull);

    }

    public void select_both_values_are_null(String bothValuesAreNull) {
        onMatchingTablePage.getMatchingProcessWidget().selectDDLByJS("Both values are null", bothValuesAreNull);
    }

}
