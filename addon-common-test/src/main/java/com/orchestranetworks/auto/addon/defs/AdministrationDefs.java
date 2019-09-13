package com.orchestranetworks.auto.addon.defs;

import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.SessionData;
import com.orchestranetworks.auto.addon.steps.AdministrationSteps;
import com.orchestranetworks.auto.addon.steps.CommonSteps;
import com.orchestranetworks.auto.addon.steps.DatasetSteps;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import net.thucydides.core.annotations.Steps;

public class AdministrationDefs {

	@Steps
	DatasetSteps onDatasetSteps;
	@Steps
	AdministrationSteps onAdministrationSteps;
	@Steps
	CommonSteps onCommonSteps;

	/**
	 * Give an access to administration service of EBX
	 * <p>
	 * <b>Example</b>: Access to dataspaces administration service:
	 * <ul>
	 * <font color="blue">And</font> I access to administration service
	 * "<font color="green">Dataspaces</font>"
	 * </ul>
	 * </p>
	 *
	 * @param service Name of the service, such as "Directory, User Interface"
	 * @throws Throwable
	 */
	@And("^I access to administration service \"([^\"]*)\"$")
	public void i_access_to_administration_service(String service) throws Throwable {
		onAdministrationSteps.go_to_admin_service(service);
	}

	/**
	 * Access to the specified parent item administration area
	 * <p>
	 * <b>Example</b>: <font color="blue">When</font> I access to
	 * "<font color="green">Match and Merge configuration</font>" parent item
	 * </p>
	 *
	 * @param path path to the parent item in administration area.
	 */

	@And("^I access to \"([^\"]*)\" parent item$")
	public void i_access_group_administration(String path) {
		onAdministrationSteps.go_to_group_administration(path);
	}

	/**
	 * Access to the specified item administration area
	 * <p>
	 * <b>Example</b>: <font color="blue">When</font> I access to
	 * "<font color="green">Match and Merge configuration</font>" item
	 * </p>
	 *
	 * @param path path to the parent item in administration area.
	 */
	@And("^I access to \"([^\"]*)\" item$")
	public void i_access_administration(String path) {
		onAdministrationSteps.go_to_administration_item(path);
	}

	/**
	 * Access a table service
	 *
	 * <p>
	 * <b>Example</b>: Access to table service
	 * <ul>
	 * <font color="blue">And</font> I access table
	 * "<font color="green">Employee</font>"
	 * </ul>
	 * </p>
	 *
	 * @param tblName table name that want to
	 * @throws Throwable
	 */
	@And("^I access table \"([^\"]*)\" service$")
	public void i_access_table_service(String tblName) throws Throwable {
		onAdministrationSteps.select_table_of_administration(tblName);
	}
	@And("^I delete the dataspace$")
	public void i_delete_the_dataspace() {
		String dataspace = SessionData.getValueFromSession(Constants.DATASPACE_IDENTIFIER);
		onCommonSteps.access_menu(Constants.MENU_ADMINISTRATION);
		onCommonSteps.go_to_administration_item("Repository management>Dataspaces");
		onCommonSteps.go_to_administration_item("Dataspaces/snapshots");
		onAdministrationSteps.filter_item(dataspace);
		onAdministrationSteps.close_dataspace(dataspace);
		onAdministrationSteps.delete_dataspace(dataspace);
	}

	@Given("^I want to create matching table$")
	public void i_want_to_create_matching_table() {
		onAdministrationSteps.access_matching_table();
	}
}
