package com.orchestranetworks.auto.addon.widget.general;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(UserCardWidgetImpl.class)
public interface UserCardWidget extends WidgetObject {
    void clickBtnLogout();

    void changeLanguage(String name);
}
