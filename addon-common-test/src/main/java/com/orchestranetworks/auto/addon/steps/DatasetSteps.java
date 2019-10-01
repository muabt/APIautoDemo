package com.orchestranetworks.auto.addon.steps;

import com.google.gson.JsonArray;
import com.orchestranetworks.auto.addon.utils.Constants;
import com.orchestranetworks.auto.addon.pages.CommonPage;
import com.orchestranetworks.auto.addon.pages.DefaultViewPage;
import com.orchestranetworks.auto.addon.pages.PermissionPage;
import com.orchestranetworks.auto.addon.pages.RecordDetailPage;
import com.orchestranetworks.auto.addon.pages.*;

import net.thucydides.core.annotations.Step;
import net.thucydides.core.steps.ScenarioSteps;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

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
    public void select_last_record() {
        defaultViewPage.getDefaultViewWidget().selectLastRecord();
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
            recordDetailPage.getToolbar().clickBtnActions();
            recordDetailPage.getToolbar().selectService(Constants.BTN_DELETE);
            recordDetailPage.getPopupWidget().confirmOK();
        }
    }

	@Step
    public void verify_record_value(int rowInd, String colName, String expected) {
        assertThat(defaultViewPage.getDefaultViewWidget().getTextDataCell(rowInd, colName)).isEqualTo(expected);
    }

    @Step
    public void confirmPopupOK() {
        defaultViewPage.getPopupWidget().confirmOK();
    }


    @Step
    public JsonArray getDefaultViewTable() {
       return defaultViewPage.getDefaultViewWidget().getDefaultViewTable();

    }
    @Step
    public void select_record_with_text(String text) {
        defaultViewPage.getDefaultViewWidget().selectCheckboxWithText(text);
    }

    @Step
    public boolean verify_record_existed(String fieldName, String keyword) {
      return  defaultViewPage.getDefaultViewWidget().verifyMAMEConfigRecordExisted(fieldName, keyword);
    }
}
