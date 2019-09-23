package com.orchestranetworks.auto.addon.widget.workspace;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(RecordDetailWidgetImpl.class)
public interface RecordDetailWidget extends WidgetObject {
	
	void clickOnTabOfLabel(String label);

    void selectTab(String tabName);

	void selectRadioButton(String label, String value);

    void addAnOccurrence();
}
