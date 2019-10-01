package com.orchestranetworks.auto.addon.widget.config;

import net.serenitybdd.core.pages.WidgetObject;
import net.serenitybdd.core.annotations.ImplementedBy;

@ImplementedBy(MatchingProcessWidgetImpl.class)
public interface MatchingProcessWidget extends WidgetObject {
	
	 void selectRadioBoxWithLabel(String label, String value);
	void selectDDLByJS(String label, String value);

}
