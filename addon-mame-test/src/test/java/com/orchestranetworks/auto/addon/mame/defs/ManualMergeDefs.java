package com.orchestranetworks.auto.addon.mame.defs;

import java.util.List;

import com.orchestranetworks.auto.addon.mame.steps.ManualMergeSteps;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;

public class ManualMergeDefs {
	@Steps
	ManualMergeSteps onManualMergeSteps;
	
	@Then("^user will see the data as below$")
    public void user_will_see_the_data_as_below(List<List<String>> tableMerge) throws Throwable {
		
		onManualMergeSteps.verify_datatable(tableMerge);
    }
	
	@And("^table is highlighted and displayed on Preview table as below$")
    public void table_is_highlighted_and_display_on_preview_table_as_below(List<List<String>> tablePreview) throws Throwable {
		
		onManualMergeSteps.verify_table_preview(tablePreview);
    }

	@When("^user completes merging process$")
    public void user_completes_merging_process() throws Throwable {
		onManualMergeSteps.click_button_next();
		onManualMergeSteps.click_button_merge();
		
		
    }


    @Then("^user will see table MappingKey as below$")
    public void user_will_see_table_mappingkey_as_below() throws Throwable {
    }

    @Then("^user will see table RecordMetadata as below$")
    public void user_will_see_table_recordmetadata_as_below() throws Throwable {
    }

}
