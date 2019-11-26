package com.orchestranetworks.auto.addon.defs;

import com.orchestranetworks.auto.addon.common.DataObject;
import com.orchestranetworks.auto.addon.common.KeyObject;
import com.orchestranetworks.auto.addon.steps.DatasetSteps;
import com.orchestranetworks.auto.addon.steps.UnmergeSteps;
import com.orchestranetworks.auto.addon.utils.Constants;
import com.orchestranetworks.auto.addon.utils.SessionData;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import net.thucydides.core.annotations.Steps;

import java.util.List;


public class UnmergeDefs {

    @Steps
    UnmergeSteps onUnmergeSteps;
    @Steps
    DatasetSteps onDatasetSteps;

    @Then("^the popup message will be shown \"([^\"]*)\"$")
    public void the_popup_message_will_be_shown(String message) {
        onUnmergeSteps.verify_message_unmerge_service_popup(message);
    }

    @And("^I verify business table before changing as below$")
    public void i_verify_business_table_before_changing_as_below(List<List<String>> dt) {
        onUnmergeSteps.verify_business_table(dt);
    }


    @Then("^I verify business table after changing as below$")
    public void i_verify_business_table_after_changing_as_below(List<List<String>> dt) {
        onUnmergeSteps.verify_business_table(dt);
    }

    @And("^I unmerge successful record has primary key as below$")
    public void iUnmergeSuccessfulRecordHasPrimaryKeyAsBelow(List<List<String>> dt) {
        onDatasetSteps.unselect_all();
        List<String> headers = dt.get(0);
        DataObject dataObject = new DataObject();
        KeyObject keyObject = null;
        for (int i = 1; i < dt.size(); i++) {
            List<String> row = dt.get(i);
            keyObject = new KeyObject();
            for (int j = 0; j < headers.size(); j++) {
                keyObject.addPK(headers.get(j), row.get(j));
            }
            dataObject.addPK(keyObject);
            onDatasetSteps.select_record_with_PK(row);
        }
        SessionData.saveDataObjectToSession(Constants.DATA_OBJECT, dataObject);
        onDatasetSteps.select_table_service("Match and Merge > Unmerge");
    }
}