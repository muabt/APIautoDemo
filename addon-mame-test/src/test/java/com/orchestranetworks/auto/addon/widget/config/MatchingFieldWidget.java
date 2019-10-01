package com.orchestranetworks.auto.addon.widget.config;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(MatchingFieldWidgetImpl.class)
public interface MatchingFieldWidget extends WidgetObject {
	
	void selectDDLByJS(String label, String value);
	
	 

}

