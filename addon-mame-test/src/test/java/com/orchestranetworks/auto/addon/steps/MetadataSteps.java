package com.orchestranetworks.auto.addon.steps;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.orchestranetworks.auto.addon.pages.MetadataPage;
import static org.assertj.core.api.Assertions.assertThat;
public class MetadataSteps {
	
	MetadataPage onMetadataPage;
	
	public void verify_list_tabs(String expectedTab){
		List<String> List = new ArrayList<String>(Arrays.asList(expectedTab.split(",")));
		
		List<String> actualTab = onMetadataPage.getMetadata().getListTab();
		
		assertThat(actualTab).isEqualTo(expectedTab);
		
        verify_tab_selected (selectedTab);


    }
}


