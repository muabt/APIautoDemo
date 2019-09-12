package com.orchestranetworks.auto.addon.widget.general;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy (PopupWidgetImpl.class)
public interface PopupWidget extends WidgetObject {
	
	void confirmPopupOk();
}