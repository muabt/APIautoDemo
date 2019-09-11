package com.orchestranetworks.auto.addon.defs;

import com.orchestranetworks.auto.addon.steps.DatasetSteps;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;

public class DatasetDefs {

    @Steps
    DatasetSteps onDatasetSteps;

    @When("^I select first \"([^\"]*)\" records in table$")
    public void user_selects_first_num_of_records_in_table(String numOfRecord) {
       /// onDatasetSteps.select_first_records(numOfRecord);
        onDatasetSteps.selectFirstRecords(numOfRecord);
    }
}
