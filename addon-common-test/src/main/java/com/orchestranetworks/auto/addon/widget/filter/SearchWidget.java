package com.orchestranetworks.auto.addon.widget.filter;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WebElementFacade;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(SearchWidgetImpl.class)
public interface SearchWidget extends WidgetObject {

    void clickApply();

    void inputTextKeyword(String keyword);

    void inputValidationKeyword(String keyword);

    void inputFuzzyKeyword(String keyword);

    void clickBtnExpand(String label);

    void switchToFilterPanel();

    void selectLogicalSearch(String logical);

    void selectSearchCriteria(String criteria);

    void selectOperatorOfField(String operator, String field);

    void inputSearchValue(String value, String type, String field);

    void selectAdvancedMode();

    void unselectField(String field);

    void selectField(String searchType, String label);

    void addLogicalBlock();

    void clickBtnAddBlock();
}
