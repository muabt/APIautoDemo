package com.orchestranetworks.auto.addon.defs;

import cucumber.api.java.en.When;

public class DatasetDefs {
    @When("^I select first \"([^\"]*)\" records in table$")
    public void user_selects_first_num_of_records_in_table(String numOfRecord) throws Throwable {
       /// onDatasetSteps.select_first_records(numOfRecord);
    }
}
