package com.orchestranetworks.auto.addon.steps;

import com.orchestranetworks.auto.addon.pages.DashboardPage;
import net.thucydides.core.annotations.Step;

import static org.assertj.core.api.Assertions.assertThat;

public class DashboardConfigurationPaneSteps {
    DashboardPage onDashboardPage;
    @Step
    public void verify_tooltip_of_tabs(String tabs, String tooltip) {
        onDashboardPage.getDashboardWidget().hoverShowDetailTooltip(tabs);
        String tooltips = onDashboardPage.getDashboardWidget().getTooltip(tabs);
        assertThat(tooltips).isEqualTo(tooltip);
    }
}
