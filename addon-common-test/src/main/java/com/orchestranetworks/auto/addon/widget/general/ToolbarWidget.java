package com.orchestranetworks.auto.addon.widget.general;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(ToolbarWidgetImpl.class)
public interface ToolbarWidget extends WidgetObject {
    void clickBtnFilter();

    void clickBtnView();

    ToolbarWidget clickBtnActions();

    void selectService(String service);

    void clickNextPage();

    void clickPreviousPage();

    void clickLastPage();

    void clickFirstPage();

    void clickBtnCreateRecord();

    void clickBtnCreateDataspace();

    void clickBtnCreateRecordMatchAndMerge(int index);

    void clickCreateNewMatchingField();
}
