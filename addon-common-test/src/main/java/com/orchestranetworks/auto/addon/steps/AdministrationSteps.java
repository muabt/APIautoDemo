package com.orchestranetworks.auto.addon.steps;

import com.orchestranetworks.auto.addon.pages.AdministrationPage;

import net.thucydides.core.annotations.Step;
import net.thucydides.core.steps.ScenarioSteps;

import static com.orchestranetworks.auto.addon.Constants.IFRAME_LEGACY;

public class AdministrationSteps extends ScenarioSteps {

	AdministrationPage administration;
	
	@Step
	public void go_to_admin_service(String service) {
		administration.getNavPanel().goToPath(service);
	}
	

	@Step
	public void select_table_of_administration(String tblName) {
		administration.getNavPanel().accessNavigationItem(tblName);
	}
	
	@Step
	public void go_to_group_administration(String path) {
		administration.getNavPanel().goToGroupAdministration(path);
	}
	
	@Step
	public void go_to_administration_item(String path) {
		administration.getNavPanel().goToAdministrationItem(path);
	}

    public void access_matching_table() {
    	administration.getHeader().accessMenu("Administration");
        getDriver().switchTo().frame(IFRAME_LEGACY);
        administration.getNavPanel().goToPath("Data quality & analytics>Match and Merge configuration");
        administration.getNavPanel().goToPath("Match and Merge configuration>Matching table");
    }
}
