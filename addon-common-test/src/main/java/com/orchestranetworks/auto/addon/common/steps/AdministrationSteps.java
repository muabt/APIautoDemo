package com.orchestranetworks.auto.addon.common.steps;

import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.common.pages.AdministrationPage;
import com.orchestranetworks.auto.addon.common.pages.DatasetPage;

import net.thucydides.core.annotations.Step;
import net.thucydides.core.steps.ScenarioSteps;

public class AdministrationSteps extends ScenarioSteps {
	
	private AdministrationPage onAdministrationPage;
	
	private DatasetPage onDatasetPage;
	
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
	
	
	@Step
	public void delete_all_data_in_table_of_administrator() {
		if (onDatasetPage.exist_record_in_table()) {
			onDatasetPage.click_btn_select_and_sort();
			onDatasetPage.select_all_record();
			onAdministrationPage.click_btn_action_table();
			onDatasetPage.select_table_service(Constants.BTN_DELETE);
			onDatasetPage.confirmPopupOK();
		}

	}
	
}
