package com.orchestranetworks.auto.addon.steps;

import com.orchestranetworks.auto.addon.pages.RecordDetailPage;
import org.junit.Assert;

import static org.assertj.core.api.Assertions.assertThat;


public class ConfigurationMatchingTableSteps {

    RecordDetailPage onRecordDetailPage;

    public void verify_error_message_data_model_field(String message) {
        Assert.assertEquals(message, onRecordDetailPage.getItemCreationWidget().getTextErrorDataModelField());
    }

    public void verify_error_message_table_field(String message) {
        Assert.assertEquals(message, onRecordDetailPage.getItemCreationWidget().getTextErrorTableField());
    }

    public void verify_error_message_data_model_in_block(String message) {
        Assert.assertEquals(message, onRecordDetailPage.getItemCreationWidget().getTextErrorDataModelInBlock());
    }

    public void verify_error_message_table_in_block(String message) {
        Assert.assertEquals(message, onRecordDetailPage.getItemCreationWidget().getTextErrorTableInBlock());
    }


    public void click_btn_expand() {
        onRecordDetailPage.getItemCreationWidget().clickBtnExpand();
    }
}

