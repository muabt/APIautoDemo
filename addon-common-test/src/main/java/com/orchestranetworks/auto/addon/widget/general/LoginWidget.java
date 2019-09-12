package com.orchestranetworks.auto.addon.widget.general;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(LoginWidgetImpl.class)
public interface LoginWidget extends WidgetObject {
    LoginWidget enterUsername(String userName);
    void enterPassword(String password);
    void clickBtnLogin();

}
