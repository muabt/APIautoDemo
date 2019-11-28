package com.orchestranetworks.auto.addon.widget;


import net.serenitybdd.core.annotations.ImplementedBy;
import net.serenitybdd.core.pages.WidgetObject;

@ImplementedBy(DashboardWidgetImpl.class)

public interface DashboardWidget extends WidgetObject {

    void getConfigurationPane();

    void hoverShowDetailTooltip(String tabs);

    String getTooltip(String tabs);
    String getTextErrorDashboardNameField();
    String getTextErrorDashboardInBlock();
}
