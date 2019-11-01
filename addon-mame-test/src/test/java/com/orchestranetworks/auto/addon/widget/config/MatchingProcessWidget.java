package com.orchestranetworks.auto.addon.widget.config;

import net.serenitybdd.core.pages.WidgetObject;
import net.serenitybdd.core.annotations.ImplementedBy;

@ImplementedBy(MatchingProcessWidgetImpl.class)
public interface MatchingProcessWidget extends WidgetObject {

    String getValueOfRadioField(String field);

    String getValueOfInputField(String field);

    String getValueOfDropdownField(String field);
}
