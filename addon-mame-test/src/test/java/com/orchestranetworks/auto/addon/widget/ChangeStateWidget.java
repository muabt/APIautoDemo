package com.orchestranetworks.auto.addon.widget;

import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;
import com.orchestranetworks.auto.addon.widget.ChangeStateWidgetImpl;

@ImplementedBy(ChangeStateWidgetImpl.class)
public interface ChangeStateWidget extends WidgetObject {
    String getStateDes();
    void clickBtnLaunchService();
    void selectTargetState();
    void selectGodelState();
}
