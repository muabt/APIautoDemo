package com.orchestranetworks.auto.addon.defs;

import com.orchestranetworks.auto.addon.steps.DatasetSteps;
import cucumber.api.java.en.And;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;

public class DatasetDefs {

    @Steps
    DatasetSteps onDatasetSteps;

    /**
     * Select number of first records in the table
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">When</font>I select first "<font color="green">4</font>" records in table
     * </ul>
     * </p>
     * @param numOfRecord number of first records that want to select
     * @throws Throwable
     */
    @When("^I select first \"([^\"]*)\" records in table$")
    public void user_selects_first_num_of_records_in_table(String numOfRecord) {
       /// onDatasetSteps.select_first_records(numOfRecord);
        onDatasetSteps.selectFirstRecords(numOfRecord);
    }

    /**
     * Select the table service
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">And</font> I select table service "<font color="green">View history</font>"
     * </ul>
     * </p>
     * @param service table service that user want to execute
     * @throws Throwable
     */
    @And("^I select table service \"([^\"]*)\"$")
    public void user_select_table_service(String service) throws Throwable {
        onDatasetSteps.selectTableService(service);
    }
}
