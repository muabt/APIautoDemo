package com.orchestranetworks.auto.addon.steps.config;

import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.pages.config.MatchingTablePage;
import com.orchestranetworks.auto.addon.pages.RecordDetailPage;
import net.thucydides.core.annotations.Step;
import org.junit.Assert;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;


public class MatchingTableSteps {

    RecordDetailPage onRecordDetailPage;
    MatchingTablePage onMatchingTablePage;

    @Step
    public void verify_error_message_data_model_field(String message) {
        Assert.assertEquals(message, onRecordDetailPage.getItemCreationWidget().getTextErrorDataModelField());
    }

    @Step
    public void verify_error_message_table_field(String message) {
        Assert.assertEquals(message, onRecordDetailPage.getItemCreationWidget().getTextErrorTableField());
    }

    @Step
    public void verify_error_message_data_model_in_block(String message) {
        Assert.assertEquals(message, onRecordDetailPage.getItemCreationWidget().getTextErrorDataModelInBlock());
    }

    @Step
    public void verify_error_message_table_in_block(String message) {
        Assert.assertEquals(message, onRecordDetailPage.getItemCreationWidget().getTextErrorTableInBlock());
    }

    @Step
    public void click_btn_expand() {
        onRecordDetailPage.getItemCreationWidget().clickBtnExpand();
    }

    @Step
    public void verify_record_detail(List<List<String>> getrecordDetail) {
        List<List<String>> recordDetails = onRecordDetailPage.getRecordDetailWidget().getRecordDetail();
        assertThat(recordDetails).isEqualTo(getrecordDetail);
    }

    @Step
    public void verify_matching_process_detail(List<List<String>> getrecordDetail) {
        onRecordDetailPage.switchOutDefaultIFrame();
        onRecordDetailPage.switchToIFrame(Constants.IFRAME_LEGACY);
        onRecordDetailPage.switchToIFrame(Constants.IFRAME_INTERNAL_POPUP);
        onRecordDetailPage.getItemCreationWidget().clickBtnExpand();
        List<List<String>> recordDetails = onRecordDetailPage.getRecordDetailWidget().getRecordDetail();
        System.out.println("record detail: " +recordDetails);
        assertThat(recordDetails).isEqualTo(getrecordDetail);
    }

    @Step
    public void verify_tooltip_of_field(String field, String tooltip) {
        onRecordDetailPage.getRecordDetailWidget().clickShowDetailTooltip(field);
        String tooltips = onRecordDetailPage.getRecordDetailWidget().getTooltip(field);
        assertThat(tooltips).isEqualTo(tooltip);
        onRecordDetailPage.getRecordDetailWidget().closeTooltipOfField(field);
    }
    @Step
    public void click_btn_preview() {
        onRecordDetailPage.getRecordDetailWidget().clickBtnPreview();
    }

}

