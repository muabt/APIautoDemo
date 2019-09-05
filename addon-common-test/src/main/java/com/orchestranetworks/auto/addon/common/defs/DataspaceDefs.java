package com.orchestranetworks.auto.addon.common.defs;

import java.util.List;
import java.util.Map;

import com.orchestranetworks.auto.addon.common.steps.DataspaceSteps;

import cucumber.api.DataTable;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import net.thucydides.core.annotations.Steps;

public class DataspaceDefs {
	@Steps
	DataspaceSteps onDataspaceSteps;

	/**
	 * Create the data space given the information
	 *
	 * <p>
	 * The table from feature files will convert to DataTable. It contains
	 * information of the dataspace that we used to create new
	 * </p>
	 *
	 * <p>
	 * <b>Example</b>:
	 * <ul>
	 * <font color="blue">And</font> I create child Dataspace with information as following
	 *     <ul>
	 *			     <font color="green">| Identifier | Owner              | English Label |</font>
	 *     </ul>
	 *     <ul>
	 *			     <font color="green">|            | John Smith (admin) | Store         |</font>
	 *     </ul>
	 * </ul>
	 * </p>
	 *
	 * @param dt
	 * @throws Throwable
	 */
	@And("^I create child Dataspace with information as following$")
	public void user_creates_child_dataspace_with_information_as_following(DataTable dt) throws Throwable {
		List<Map<String, String>> dataTable = dt.asMaps(String.class, String.class);
		onDataspaceSteps.click_btn_create_dataspace();
		Map<String, String> row = dataTable.get(0);
		String identifier = row.get("Identifier");
		String owner = row.get("Owner");
		String engLabel = row.get("English Label");

		if (!identifier.isEmpty()) {
			onDataspaceSteps.enter_identifier(identifier);
		}
		if (!owner.isEmpty()) {
			onDataspaceSteps.select_owner(owner);

		}
		if (!engLabel.isEmpty()) {
			onDataspaceSteps.enter_english_label(engLabel);

		}
		onDataspaceSteps.click_btn_create();

	}

	/**
	 * Access to the dataspace service
	 * @param servicePath path of the dataspace service
	 * @throws Throwable
	 */
	@And("^I select dataspace service \"([^\"]*)\"$")
	public void user_select_dataspace_service(String servicePath) throws Throwable {
		onDataspaceSteps.click_dataspace_actions();
		onDataspaceSteps.select_dataspace_service(servicePath);
	}

	/**
	 * Close the data space using given service
	 * <p>
	 * <b>Example</b>:
	 * <font color="blue">And</font> I close dataspace with service "<font color="green">Close this dataspace</font>"
	 * </p>
	 * @param servicePath path to service
	 * @throws Throwable
	 */
	@And("^I close dataspace with service \"([^\"]*)\"$")
	public void i_close_dataspace_with_service(String servicePath) throws Throwable {
		onDataspaceSteps.click_dataspace_actions();
		onDataspaceSteps.close_dataspace(servicePath);
	}

	/**
	 * Check the data space information
	 * <p>
	 * <b>Example</b>:
	 * <ul>
	 * <font color="blue">Then</font> I should see Dataspace with information as following
	 *      <ul>
	 *			     <font color="green">| Identifier | Type | Creation | Status | Owner | Loading strategy | Child merge policy | Child dataspace sort policy |</font>
	 *     </ul>
	 *     <ul>
	 *			     <font color="green">| Store | Dataspace | | Open | John Smith (admin) | On-demand loading and unloading | Allows validation errors in result | By label |</font>
	 *     </ul>
	 * </ul>
	 * </p>
	 * @param dt
	 * @throws Throwable
	 */
	@Then("^I should see Dataspace with information as following$")
	public void user_should_see_dataspace_with_information_as_following(DataTable dt) throws Throwable {
	}
}
