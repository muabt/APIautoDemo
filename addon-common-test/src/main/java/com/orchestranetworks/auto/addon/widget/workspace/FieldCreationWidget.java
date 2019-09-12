package com.orchestranetworks.auto.addon.widget.workspace;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy (FieldCreationImpl.class)
public interface FieldCreationWidget extends WidgetObject  {

	void clickProfile();
	
	void chooseProfile();
}
