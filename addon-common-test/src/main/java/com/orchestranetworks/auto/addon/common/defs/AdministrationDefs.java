package com.orchestranetworks.auto.addon.common.defs;

import com.orchestranetworks.auto.addon.common.steps.AdministrationSteps;
import com.orchestranetworks.auto.addon.common.steps.CommonSteps;
import com.orchestranetworks.auto.addon.common.steps.DatasetSteps;

import cucumber.api.java.en.And;
import net.thucydides.core.annotations.Steps;

public class AdministrationDefs {
	@Steps
	DatasetSteps onDatasetSteps;
	@Steps
	AdministrationSteps onAdministrationSteps;
	@Steps
	CommonSteps onCommonSteps;

	@And("^I access to administration service \"([^\"]*)\"$")
	public void i_access_to_administration_service_something(String service) throws Throwable {
		onAdministrationSteps.go_to_admin_service(service);
	}

	@And("^I access table \"([^\"]*)\" service$")
	public void i_access_table_something_service(String tblName) throws Throwable {
		onAdministrationSteps.select_table_of_administration(tblName);
	}

	@And("^I delete the dataspace \"([^\"]*)\" with service \"([^\"]*)\"$")
	public void i_delete_the_dataspace_something_with_service_something(String dataspaceName, String servicePath)
			throws Throwable {
		onDatasetSteps.select_record_with_PK(dataspaceName);
		onDatasetSteps.click_btn_action_table();
		onDatasetSteps.select_table_service(servicePath);
		onCommonSteps.click_btn_submit();
		onCommonSteps.confirm_popup();
	}
}
