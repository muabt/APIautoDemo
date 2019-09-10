package com.orchestranetworks.auto.addon.widget.filter;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WebElementFacade;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(SearchWidgetImpl.class)
public interface SearchWidget extends WidgetObject {

	void clickApply(String id);

	void inputKeyword(String id);

	WebElementFacade getBtnExpand();

	void switchToFilterPanel();
}
