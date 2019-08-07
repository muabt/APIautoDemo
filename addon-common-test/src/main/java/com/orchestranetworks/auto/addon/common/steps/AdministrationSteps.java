package com.orchestranetworks.auto.addon.common.steps;

import com.orchestranetworks.auto.addon.common.pages.AdministrationPage;

import net.thucydides.core.annotations.Step;

public class AdministrationSteps {
	AdministrationPage onAdministrationPage;
	
	
	@Step
	public void go_to_admin_service(String service) {
		onAdministrationPage.select_an_admin_feature();
		onAdministrationPage.go_to_admin_service(service);
	}

	@Step
	public void select_table_of_administration(String tblName) {
		onAdministrationPage.click_on_table_service_of_administration(tblName);
	}
}
