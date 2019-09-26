package com.orchestranetworks.auto.addon.widget;

import net.serenitybdd.core.pages.WidgetObject;
import net.serenitybdd.core.annotations.ImplementedBy;

@ImplementedBy(MatchingProcessWidgetImpl.class)
public interface MatchingProcessWidget extends WidgetObject {
	
	 void selectRadioBoxWithLabel(String label, String value);

}
