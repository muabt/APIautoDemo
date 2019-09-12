package com.orchestranetworks.auto.addon.steps;

import com.orchestranetworks.auto.addon.pages.CommonPage;
import com.orchestranetworks.auto.addon.pages.DefaultViewPage;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.steps.ScenarioSteps;

public class DatasetSteps extends ScenarioSteps {
    DefaultViewPage defaultViewPage;
    CommonPage commonPage;

    @Step
    public void selectFirstRecords(String num) {
        defaultViewPage.getDefaultViewWidget().selectFirstRecords(Integer.parseInt(num));
    }

    @Step
    public void selectTableService(String service) {
        commonPage.getToolbar().selectService(service);
    }
}
