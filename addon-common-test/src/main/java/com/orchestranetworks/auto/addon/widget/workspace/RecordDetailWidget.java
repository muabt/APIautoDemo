package com.orchestranetworks.auto.addon.widget.workspace;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(RecordDetailWidgetImpl.class)
public interface RecordDetailWidget extends WidgetObject {
	
	public void clickOnTabOfLabel(String label);
}
