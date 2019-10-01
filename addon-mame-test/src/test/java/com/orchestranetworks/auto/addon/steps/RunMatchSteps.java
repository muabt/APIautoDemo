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
	
	


}
