package com.orchestranetworks.auto.addon.steps;

import java.util.Map;

import com.orchestranetworks.auto.addon.utils.Constants;
import com.orchestranetworks.auto.addon.pages.RunMatchPage;

import net.thucydides.core.annotations.Step;

public class RunMatchSteps {
	
	private static final String MATCH_AGAINST = "Records to match against";
	
	private RunMatchPage onRunMatchPage;
	
	public void input_run_match(Map<String, String> runMatchInfo) {
        String matchAgainst = runMatchInfo.get(MATCH_AGAINST);
        onRunMatchPage.getRunMatchWidget().selectRecordToMatchAgainst(MATCH_AGAINST, matchAgainst);
    }
	
	public void click_on_run_match() {
        onRunMatchPage.getRunMatchWidget().clickBtnRunMatch();
    }
	
	public void verify_message_run_match_service_can_not_executed_by_no_matching_process_is_actived() {
		onRunMatchPage.getRunMatchWidget().verifyMessageNoMatchingProcessIsActived();
	}
	
	public void verify_message_run_match_service_can_not_executed_by_no_decision_tree_is_configured() {
		onRunMatchPage.getRunMatchWidget().verifyMessageNoDecisionTreeIsConfigured();
	}
	
	@Step
    public void view_record_with_name(String tab, String label) {
		
		onRunMatchPage.getRecordDetailWidget().selectTab(tab);
		onRunMatchPage.getRecordDetailWidget().viewRecordWithText(label);
		onRunMatchPage.switchToIFrame(Constants.IFRAME_INTERNAL_POPUP);
		onRunMatchPage.getItemCreationWidget().clickBtnExpand();
    }
	
	@Step
    public void view_matching_field_record_with_name(String tab, String label) {
		
		onRunMatchPage.getRecordDetailWidget().selectTab(tab);
		onRunMatchPage.getRecordDetailWidget().viewRecordWithTextWithDecorator(label);
		onRunMatchPage.switchToIFrame(Constants.IFRAME_INTERNAL_POPUP);
		onRunMatchPage.getItemCreationWidget().clickBtnExpand();
    }
	
	
	@Step
    public void select_keep_not_matched_records_untouched(String keepNotMatchedRecordsUntouched) {
		onRunMatchPage.getMatchingProcessWidget().selectRadioBoxWithLabel("Keep not matched records untouched", keepNotMatchedRecordsUntouched);
    }
    
    @Step
    public void select_merged_record_is_recycled(String mergedRecordIsRecycled) {
    	onRunMatchPage.getMatchingProcessWidget().selectRadioBoxWithLabel("Merged record is recycled", mergedRecordIsRecycled);
    }
    
    @Step
    public void select_modify_merged_without_match(String modifyMergedWithoutMatch) {
    	
    	
    	onRunMatchPage.getMatchingProcessWidget().selectRadioBoxWithLabel("Modify merged without match", modifyMergedWithoutMatch);
    }

	public void select_one_of_the_values_is_null(String oneOfTheValuesIsNull) {
		
		onRunMatchPage.getMatchingFieldWidget().selectDDLByJS("One of the values is null", oneOfTheValuesIsNull);
				
	}

	public void select_both_values_are_null(String bothValuesAreNull) {
		onRunMatchPage.getMatchingFieldWidget().selectDDLByJS("Both values are null", bothValuesAreNull);
	}
	

}
