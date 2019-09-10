package com.orchestranetworks.auto.addon.widget.general;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(HeaderWidgetImpl.class)
public interface HeaderWidget extends WidgetObject {
    void accessMenu(String menu);

    void openUserCard();

    void clickBtnSelectPerspective();

    boolean isHeaderExist();

    void openUserPanel();

    void selectPerspective(String perName);

    void removeChooseDatasetDiv();
}
