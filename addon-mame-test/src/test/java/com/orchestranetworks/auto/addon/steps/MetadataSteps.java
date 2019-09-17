package com.orchestranetworks.auto.addon.steps;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.orchestranetworks.auto.addon.pages.MetadataPage;
import static org.assertj.core.api.Assertions.assertThat;

public class MetadataSteps {
	
	MetadataPage onMetadataPage;
	
	public void verify_list_tabs(List<String> listTab){
		
		//List<String> List = new ArrayList<String>(Arrays.asList(listTab.split(",")));
		
		List<String> actualTab = onMetadataPage.getMetadata().getListTab();
		assertThat(actualTab).isEqualTo(listTab);
			
		}
	
	public void verify_data_displayed_in_main_tab(List<String> getMetadatRecordView) {	
		
	}
	
	public static void main(String args[]){
		
		
		
	}
	
}


