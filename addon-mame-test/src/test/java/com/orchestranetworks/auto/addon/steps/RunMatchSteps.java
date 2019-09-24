package com.orchestranetworks.auto.addon.steps;

import java.util.Map;

import com.orchestranetworks.auto.addon.pages.RunMatchPage;

public class RunMatchSteps {
	
	private static final String MATCH_AGAINST = "Records to match against";
	
	private RunMatchPage onRunMatchPage;
	
	public void input_run_match(Map<String, String> runMatchInfo) {
//        String matchingPolicyCode = SessionData.getValueFromSession(MAMEConstants.MATCHING_POLICY_CODE_KEY);
//        onRunMatchPage.getRunMatchWidget().selectMatchingProcessCode(MATCH_PROCESS, matchingPolicyCode);
        
        String matchAgainst = runMatchInfo.get(MATCH_AGAINST);
        onRunMatchPage.getRunMatchWidget().selectRecordToMatchAgainst(MATCH_AGAINST, matchAgainst);
    }
	
	public void click_on_run_match() {
        onRunMatchPage.getRunMatchWidget().clickBtnRunMatch();
    }

}
