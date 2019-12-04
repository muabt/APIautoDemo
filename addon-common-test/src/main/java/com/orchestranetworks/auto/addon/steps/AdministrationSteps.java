package com.orchestranetworks.auto.addon.steps;

import com.orchestranetworks.auto.addon.utils.Constants;
import com.orchestranetworks.auto.addon.pages.AdministrationPage;

import net.thucydides.core.annotations.Step;
import net.thucydides.core.steps.ScenarioSteps;

public class AdministrationSteps extends ScenarioSteps {

    AdministrationPage administration;

    @Step
    public void access_matching_table() {
        administration.getHeader().accessMenu("Administration");
        administration.getNavPanel().goToPath("Data quality & analytics>Match and Merge configuration");
        administration.getNavPanel().goToPath("Match and Merge configuration>Matching table");
    }

    @Step
    public void delete_dataspace(String dataspace) {
        administration.getDefaultViewWidget().selectRecordWithPK(dataspace);
        administration.getToolbar().clickBtnActions().selectService("Delete dataspaces and snapshots recursively");
        administration.getFooter().clickBtnSubmit();
        administration.getPopup().confirmOK();
    }

    @Step
    public void close_dataspace(String dataspace) {
        administration.getDefaultViewWidget().selectRecordWithPK(dataspace);
        administration.getToolbar().clickBtnActions().selectService("Close dataspaces and snapshots recursively");
        administration.getFooter().clickBtnSubmit();
        administration.getPopup().confirmOK();
    }

    @Step
    public void select_record_with_name(String label) {
        administration.getDefaultViewWidget().accessRecordWithText(label);
    }

    @Step
    public void filter_item(String dataspace) {
        administration.getToolbar().clickBtnFilter();
    }


    @Step
    public void access_import_service_in_actions_in_left_panel() {
        administration.getNavPanel().clickBtnActions().selectService(Constants.LBL_IMPORT);
    }

    @Step
    public void select_file_to_import(String fileName) {
        administration.getImportWidget().selectFileThenImport(fileName);

    }
}
