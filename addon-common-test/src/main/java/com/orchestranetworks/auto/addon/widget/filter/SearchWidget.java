package com.orchestranetworks.auto.addon.widget.filter;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WebElementFacade;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(SearchWidgetImpl.class)
public interface SearchWidget extends WidgetObject {

	void clickApply();

	void inputKeyword(String id);

	void clickBtnExpand(String label);

	void switchToFilterPanel();

	void selectSearchCriteria(String criteria);

	void selectAdvancedMode();

	void unselectField(String field);

	void addLogicalBlock();
}
