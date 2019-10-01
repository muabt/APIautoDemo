package com.orchestranetworks.auto.addon.widget;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(ChangeStateWidgetImpl.class)
public interface ChangeStateWidget extends WidgetObject {
    String getStateDes();
    void clickBtnLaunchService();
    void selectTargetState(String state);



}
