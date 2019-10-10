package com.orchestranetworks.auto.addon.defs;

import com.orchestranetworks.auto.addon.utils.Constants;
import com.orchestranetworks.auto.addon.utils.SessionData;
import com.orchestranetworks.auto.addon.steps.AdministrationSteps;
import com.orchestranetworks.auto.addon.steps.CommonSteps;
import com.orchestranetworks.auto.addon.steps.DataspaceSteps;
import cucumber.api.DataTable;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class DataspaceDefs {
    @Steps
    DataspaceSteps onDataspaceSteps;
    @Steps
    CommonSteps onCommonSteps;
    @Steps
    AdministrationSteps onAdministrationSteps;

    /**
     * Create the dataspace given the information
     *
     * <p>
     * The table from feature files will convert to DataTable. It contains
     * information of the dataspace that we used to create new
     * </p>
     *
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">And</font> I create a child of dataspace "FastTrack>[03] Parties data>Company employees" with information as following
     *     <ul>
     * 			     <font color="green">| Identifier | Owner              | English Label |</font>
     *     </ul>
     *     <ul>
     * 			     <font color="green">|            | John Smith (admin) | Store         |</font>
     *     </ul>
     * </ul>
     * </p>
     *
     * @param parentDataspacePath path to parent dataspace
     * @param dt
     */

    @When("^I create a child of dataspace \"([^\"]*)\" with information as following$")
    public void i_create_a_child_of_dataspace_with_information_as_following(String parentDataspacePath, DataTable dt) {
        List<Map<String, String>> dataTable = dt.asMaps(String.class, String.class);
        Map<String, String> row = dataTable.get(0);
        String identifier = row.get("Identifier");
        String owner = row.get("Owner");
        String engLabel = row.get("English Label");

        onCommonSteps.access_menu(Constants.MENU_DATASPACE);
        if (!identifier.isEmpty()) {
            SessionData.saveValueToSession(Constants.DATASPACE_IDENTIFIER, identifier);
            if (onDataspaceSteps.is_dataspace_exist(identifier))
                onDataspaceSteps.delete_dataspace_by_service(identifier);
        }
        onCommonSteps.go_to_dataspace(parentDataspacePath);
        onDataspaceSteps.click_btn_create_dataspace();
        onDataspaceSteps.enter_dataspace_info(identifier, owner, engLabel);
        onDataspaceSteps.click_btn_create();
    }

    /**
     * Access to the dataspace service
     *
     * @param servicePath path of the dataspace service
     * @throws Throwable
     */
    @And("^I select dataspace service \"([^\"]*)\"$")
    public void i_select_dataspace_service(String servicePath) throws Throwable {
        onDataspaceSteps.click_dataspace_actions();
        onDataspaceSteps.select_dataspace_service(servicePath);
    }

    /**
     * Check the data space information
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">Then</font> I should see Dataspace with information as following
     *      <ul>
     * 			     <font color="green">| Identifier | Type | Creation | Status | Owner | Loading strategy | Child merge policy | Child dataspace sort policy |</font>
     *     </ul>
     *     <ul>
     * 			     <font color="green">| Store | Dataspace | | Open | John Smith (admin) | On-demand loading and unloading | Allows validation errors in result | By label |</font>
     *     </ul>
     * </ul>
     * </p>
     *
     * @param dt
     * @throws Throwable
     */
    @Then("^I should see dataspace with information as following$")
    public void user_should_see_dataspace_with_information_as_following(DataTable dt) throws Throwable {
        List<Map<String, String>> dataTable = dt.asMaps(String.class, String.class);
        Map<String, String> row = dataTable.get(0);
        List<String> info = new ArrayList<String>();
        info.add(row.get("Identifier"));
        info.add(row.get("Type"));
        info.add(row.get("Owner"));
        info.add(row.get("Status"));
        info.add(row.get("Loading strategy"));
        info.add(row.get("Child merge policy"));
        onDataspaceSteps.verify_dataspace(info);
    }

    /**
     * Delete the data space that was saved in Serenity session
     */
    @And("^I delete the dataspace$")
    public void i_delete_the_dataspace() {
        onDataspaceSteps.delete_dataspace_by_service();
    }

    @And("^I delete the \"([^\"]*)\" dataspace$")
    public void i_delete_the_dataspace(String dataspaceName) {
        onDataspaceSteps.delete_dataspace_by_service(dataspaceName);

    }


}

