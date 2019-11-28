package com.orchestranetworks.auto.addon.steps;

import com.orchestranetworks.auto.addon.pages.CommonPage;
import com.orchestranetworks.auto.addon.pages.DashboardPage;
import com.orchestranetworks.auto.addon.widget.DashboardWidget;
import net.thucydides.core.annotations.Step;
import org.junit.Assert;

import static org.assertj.core.api.Assertions.assertThat;

public class DashboardSteps {
    DashboardPage onDashboardPage;
    DashboardWidget onDashboardWidget;
    CommonPage commonPage;

    @Step
    public void verify_error_message_dashboard_name_field(String message) {
        Assert.assertEquals(message, onDashboardPage.getDashboardWidget().getTextErrorDashboardNameField());
    }


    @Step
    public void verify_error_message_dashboard_name_in_block(String message) {
        Assert.assertEquals(message, onDashboardPage.getDashboardWidget().getTextErrorDashboardInBlock());
    }


    @Step
    public void verify_the_display_configuration_pane() {
        onDashboardPage.getDashboardWidget().getConfigurationPane();
    }

    @Step
    public void verify_tooltip_of_tabs(String tabs, String tooltip) {
        onDashboardPage.getDashboardWidget().hoverShowDetailTooltip(tabs);
        String tooltips = onDashboardPage.getDashboardWidget().getTooltip(tabs);
        assertThat(tooltips).isEqualTo(tooltip);
    }
    @Step
    public void input_dashboard_record_field(String col, String cell, String dataType) {
        onDashboardPage.getItemCreationWidget().inputFieldContent(col, cell, dataType);
    }

    public void click_btn_save_and_close() {
        commonPage.getFooter().clickBtnSaveAndClose();
    }

}
