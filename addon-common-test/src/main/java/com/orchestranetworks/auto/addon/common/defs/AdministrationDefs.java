package com.orchestranetworks.auto.addon.common.defs;

import com.orchestranetworks.auto.addon.common.steps.AdministrationSteps;
import com.orchestranetworks.auto.addon.common.steps.CommonSteps;
import com.orchestranetworks.auto.addon.common.steps.DatasetSteps;

import cucumber.api.java.en.And;
import cucumber.api.java.en.When;
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
     * <font color="blue">And</font> I access to administration service "<font color="green">Dataspaces</font>"
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
	 * @param path
	 *            path to the parent item in administration area. 
	 */
    
	@And("^I access to \"([^\"]*)\" parent item$")
	public void user_accesses_group_administration(String path) {
		onAdministrationSteps.go_to_group_administration(path);
	}
	
	/**
	 * Access to the specified item administration area
	 * <p>
	 * <b>Example</b>: <font color="blue">When</font> I access to
	 * "<font color="green">Match and Merge configuration</font>" item
	 * </p>
	 *
	 * @param path
	 *            path to the parent item in administration area. 
	 */
	@And("^I access to \"([^\"]*)\" item$")
	public void user_accesses_administration(String path) {
		onAdministrationSteps.go_to_administration_item(path);
	}
    
    /**
     * Access a table service
     *
     * <p>
     * <b>Example</b>: Access to table service
     * <ul>
     * <font color="blue">And</font> I access table "<font color="green">Employee</font>"
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

    /**
     * Delete a data space of EBX using a service
     *
     * <p>
     * <b>Example</b>: Delete the Dataspace Store (Store)
     *
     * <ul>
     * <font color="blue">And</font> I delete the dataspace "<font color="green">Dataspace Store (Store)</font>"
     * with service "<font color="green">Delete dataspaces and snapshots recursively</font>"
     * </ul>
     * </p>
     * @param dataspaceName name of data space need to delete
     * @param servicePath   name of the service used to dedelete
     * @throws Throwable
     */
    @And("^I delete the dataspace \"([^\"]*)\" with service \"([^\"]*)\"$")
    public void i_delete_the_dataspace_with_service(String dataspaceName, String servicePath)
            throws Throwable {
        onDatasetSteps.select_record_with_PK(dataspaceName);
        onDatasetSteps.click_btn_action_table();
        onDatasetSteps.select_table_service(servicePath);
        onCommonSteps.click_btn_submit();
        onCommonSteps.confirm_popup();
    }
}
