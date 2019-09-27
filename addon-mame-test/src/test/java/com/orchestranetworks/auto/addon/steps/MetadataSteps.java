package com.orchestranetworks.auto.addon.steps;

import java.util.List;

import com.orchestranetworks.auto.addon.pages.ManageGroupPage;
import com.orchestranetworks.auto.addon.pages.MetadataPage;
import org.junit.Assert;

import static org.assertj.core.api.Assertions.assertThat;

public class MetadataSteps {

    MetadataPage onMetadataPage;
    ManageGroupPage onManageGroupPage;

    public void verify_list_tabs(List<String> listTab) {
        List<String> actualTab = onMetadataPage.getMetadata().getListTab();
        boolean isSelected = onMetadataPage.getMetadata().isMainSelected();
      //  Assert.assertEquals(listTab, actualTab);
       assertThat(actualTab).isEqualTo(listTab);
       assertThat(isSelected).isEqualTo(true);
    }

    public void verify_data_displayed_in_main_tab(List<List<String>> getMetadataRecordView) {
        List<List<String>> metadataRecordView = onMetadataPage.getMetadata().getMetadataRecordView();
        assertThat(metadataRecordView).isEqualTo(getMetadataRecordView);
    }


    public void click_button_preview_record() {
        onMetadataPage.getMetadata().clickBtnPreviewRecord();
    }

    public void verify_record_details(List<List<String>> getDataRecordDetail) {
        List<List<String>> recordDetails = onMetadataPage.getMetadata().getDataRecordDetail();
    }

    public void click_button_close() {
        onMetadataPage.getMetadata().clickBtnClose();
    }

    public void click_button_preview_group() {
        onMetadataPage.getMetadata().clickBtnPreviewGroup();
    }

    public void verify_header(String recordLable) {
        click_button_preview_group();
        Assert.assertEquals("Manage group ("+recordLable+")", onMetadataPage.getMetadata().getHeaderManageGroup());
       Assert.assertEquals("Metadata : "+recordLable+"", onMetadataPage.getMetadata().getHeaderMetadata());
    }
    public void verify_duplicate_table (List<List<String>> duplicateTable) {
        List<List<String>> actual = onManageGroupPage.getManageGroupWidget().getDataDuplicatesTable();
        assertThat(actual).isEqualTo(duplicateTable);
    }

    public void verify_suspect_table (List<String> suspectTable) {
        List<String> actual = onManageGroupPage.getManageGroupWidget().getDataSuspectsTable();
        assertThat(actual).isEqualTo(suspectTable);
    }
    public void verify_no_record (String suspectNoRecord) {
        Assert.assertEquals(suspectNoRecord+".", onManageGroupPage.getManageGroupWidget().getNoRecordFound());
    }
}