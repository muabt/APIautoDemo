package com.orchestranetworks.auto.addon.steps;

import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.pages.CommonPage;
import com.orchestranetworks.auto.addon.pages.DefaultViewPage;
import com.orchestranetworks.auto.addon.pages.PermissionPage;
import com.orchestranetworks.auto.addon.pages.RecordDetailPage;
import com.orchestranetworks.auto.addon.pages.*;

import net.thucydides.core.annotations.Step;
import net.thucydides.core.steps.ScenarioSteps;

public class DatasetSteps extends ScenarioSteps {
    DefaultViewPage defaultViewPage;
    CommonPage commonPage;
    PermissionPage permissionPage;
    RecordDetailPage recordDetailPage;
    BasePage onBasePage;

    @Step
    public void select_first_record(String num) {
        defaultViewPage.getDefaultViewWidget().selectFirstRecords(Integer.parseInt(num));
    }

    @Step
    public void select_table_service(String service) {
        commonPage.getToolbar().clickBtnActions().selectService(service);
    }

    @Step
    public void select_record_with_PK(String[] recordPKs) {
        defaultViewPage.getDefaultViewWidget().selectRecordWithPK(recordPKs);
    }

    @Step
    public void select_record_with_PK(String recordID) {
        if (recordID.contains("|")) {
            String[] ids = recordID.split("\\|");
            defaultViewPage.getDefaultViewWidget().selectRecordWithPK(ids);
        } else {
            defaultViewPage.getDefaultViewWidget().selectRecordWithPK(recordID);
        }
    }

    @Step
    public void select_dataset_service(String service) {
        commonPage.getNavPanel().selectDatasetService(service);
    }

    @Step
    public void click_btn_create_record() {
        defaultViewPage.getToolbar().clickBtnCreateRecord();
    }

    @Step
    public void click_profile() {
        permissionPage.getFieldCreationWidget().clickProfile();
    }

    @Step
    public void choose_profile() {
        permissionPage.getFieldCreationWidget().chooseProfile();
    }

    @Step
    public void click_btn_save_and_close() {
        commonPage.getFooter().clickBtnSaveAndClose();
    }

    @Step
    public void input_record_field(String col, String cell, String dataType) {
        recordDetailPage.getItemCreationWidget().inputFieldContent(col, cell, dataType);
    }


    @Step
	public void click_on_tab_label(String label) {
    	recordDetailPage.getRecordDetailWidget().clickOnTabOfLabel(label);
	}

    @Step
	public void delete_all_data_in_table() {
		if (defaultViewPage.getDefaultViewWidget().existRecordInTable()) {
			defaultViewPage.getDefaultViewWidget().clickBtnSelectAndSort();
			defaultViewPage.getDefaultViewWidget().selectAllRecord();
			recordDetailPage.getToolbar().clickBtnByLabel("Action");
			recordDetailPage.getToolbar().selectService(Constants.BTN_DELETE);
			recordDetailPage.getDefaultViewWidget().confirmPopupOK();
		}

	}
    @Step
    public void confirmPopupOK() {
        defaultViewPage.getPopupWidget().confirmOK();
    }
}
