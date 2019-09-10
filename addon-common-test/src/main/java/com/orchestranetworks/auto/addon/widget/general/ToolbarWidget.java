package com.orchestranetworks.auto.addon.widget.general;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WebElementFacade;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(ToolbarWidgetImpl.class)
public interface ToolbarWidget extends WidgetObject {
	void clickBtnFilter();

	WebElementFacade getBtnView();

	WebElementFacade getBtnActions();

	void selectService(String service);
}
