package com.orchestranetworks.auto.addon.defs;

import com.orchestranetworks.auto.addon.steps.DataspaceSteps;
import cucumber.api.DataTable;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;

import java.util.List;
import java.util.Map;

public class DataspaceDefs {
    @Steps
    DataspaceSteps onDataspaceSteps;
    @Steps
    CommonDefs onCommonDefs;
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
     *			     <font color="green">| Identifier | Owner              | English Label |</font>
     *     </ul>
     *     <ul>
     *			     <font color="green">|            | John Smith (admin) | Store         |</font>
     *     </ul>
     * </ul>
     * </p>
     * @param parentDataspacePath path to parent dataspace
     * @param dt
     */

    @When("^I create a child of dataspace \"([^\"]*)\" with information as following$")
    public void i_create_a_child_of_dataspace_with_information_as_following(String parentDataspacePath, DataTable dt)  {
        List<Map<String, String>> dataTable = dt.asMaps(String.class, String.class);
        onCommonDefs.i_access_menu("dataspace");
        onCommonDefs.i_access_dataspace(parentDataspacePath);
        onDataspaceSteps.click_btn_create_dataspace();
        Map<String, String> row = dataTable.get(0);
        String identifier = row.get("Identifier");
        String owner = row.get("Owner");
        String engLabel = row.get("English Label");

        onDataspaceSteps.enter_dataspace_info(identifier,owner,engLabel);

        onDataspaceSteps.click_btn_create();
    }
}
