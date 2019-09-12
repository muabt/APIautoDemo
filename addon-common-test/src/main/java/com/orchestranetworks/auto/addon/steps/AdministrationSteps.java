package com.orchestranetworks.auto.addon.steps;

import com.orchestranetworks.auto.addon.pages.AdministrationPage;
import com.orchestranetworks.auto.addon.pages.CommonPage;
import net.thucydides.core.steps.ScenarioSteps;

import static com.orchestranetworks.auto.addon.Constants.IFRAME_LEGACY;

public class AdministrationSteps extends ScenarioSteps {
    AdministrationPage onAdministrationPage;

    public void access_matching_table() {
        onAdministrationPage.getHeader().accessMenu("Administration");
        getDriver().switchTo().frame(IFRAME_LEGACY);
        onAdministrationPage.getNavPanel().goToPath("Data quality & analytics>Match and Merge configuration");
        onAdministrationPage.getNavPanel().goToPath("Match and Merge configuration>Matching table");
    }
}
