package com.orchestranetworks.auto.addon.widget;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(RunMatchWidgetImpl.class)
public interface RunMatchWidget extends WidgetObject {
	
	void clickBtnRunMatch();

	void selectRecordToMatchAgainst(String label, String matchAgainst);
	
	void verifyMessageNoMatchingProcessIsActived();
	
	
	void verifyMessageNoDecisionTreeIsConfigured();
	
	void expandMatchingProcessAdvancedSettings();
	
}
