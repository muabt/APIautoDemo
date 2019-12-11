package com.orchestranetworks.auto.addon.widget;


import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(DashboardWidgetImpl.class)

public interface DashboardWidget extends WidgetObject {

    boolean getConfigurationPane();

    void hoverShowDetailTooltip(String tabs);

    String getTooltip(String tabs);
    String getTextErrorDashboardNameField();

    String getPopupCloseContent();

    void clickBtnExpandFrench();
}
