package com.orchestranetworks.auto.addon.common.steps;

import com.orchestranetworks.auto.addon.common.pages.AdministrationPage;

import net.thucydides.core.annotations.Step;
import net.thucydides.core.steps.ScenarioSteps;

public class AdministrationSteps extends ScenarioSteps {
	
	private AdministrationPage onAdministrationPage;
	
	@Step
	public void go_to_admin_service(String service) {
		onAdministrationPage.select_an_admin_feature();
		onAdministrationPage.go_to_admin_service(service);
	}
	

	@Step
	public void select_table_of_administration(String tblName) {
		onAdministrationPage.click_on_table_service_of_administration(tblName);
	}
	
	@Step
	public void go_to_group_administration(String path) {
		onAdministrationPage.go_to_group_administration(path);
	}
	
	@Step
	public void go_to_administration_item(String path) {
		onAdministrationPage.go_to_administration_item(path);
	}
	
}
