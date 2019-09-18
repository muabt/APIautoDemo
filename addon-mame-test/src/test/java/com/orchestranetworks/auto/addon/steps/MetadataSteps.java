package com.orchestranetworks.auto.addon.steps;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.orchestranetworks.auto.addon.pages.MetadataPage;
import static org.assertj.core.api.Assertions.assertThat;

public class MetadataSteps {
	
	MetadataPage onMetadataPage;
	
	public void verify_list_tabs(List<String> listTab){
		List<String> actualTab = onMetadataPage.getMetadata().getListTab();
		boolean isSelected = onMetadataPage.getMetadata().isMainSelected();
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
	
	public void verify_record_details  () {
		List<List<String>> recordDetails = onMetadataPage.getMetadata().getDataRecordDetail();
    }
	
	public void click_button_close() {
        onMetadataPage.getMetadata().clickBtnClose();
    }
    
	public void click_button_preview_group() {
        onMetadataPage.getMetadata().clickBtnPreviewGroup();
    }
	
	public void verify_data_displayed_in_duplicates_table() {	
		List<List<String>> duplicatesTable = onMetadataPage.getMetadata().getDataRecordDuplicatesTable();
	
	
}
	public void verify_data_displayed_in_suspect_table() {	
		List<List<String>> suspectTable = onMetadataPage.getMetadata().getDataRecordSuspectTable();
	}
}