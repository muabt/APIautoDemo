package com.orchestranetworks.auto.addon.steps;

import com.orchestranetworks.auto.addon.common.TableObject;
import com.orchestranetworks.auto.addon.utils.Constants;
import com.orchestranetworks.auto.addon.pages.CommonPage;
import com.orchestranetworks.auto.addon.pages.DefaultViewPage;
import com.orchestranetworks.auto.addon.pages.PermissionPage;
import com.orchestranetworks.auto.addon.pages.RecordDetailPage;
import com.orchestranetworks.auto.addon.pages.*;

import net.thucydides.core.annotations.Step;
import net.thucydides.core.steps.ScenarioSteps;

import java.util.Arrays;
import java.util.List;

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
    public void select_dataset_service(String service) {
        commonPage.getDatasetToolbar().clickBtnDatasetActions().selectDatasetService(service);
    }
    @Step
    public void select_record_with_PK(List<String> recordPKs) {
        defaultViewPage.getDefaultViewWidget().selectRecordWithPK(recordPKs);
    }

    @Step
    public void select_record_with_PK(String recordID) {
        if (recordID.contains("|")) {
            List<String> ids = Arrays.asList(recordID.split("\\|"));
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
        if (defaultViewPage.getDefaultViewWidget().isRecordInTableExisted()) {
            defaultViewPage.getDefaultViewWidget().clickBtnSelectAndSort();
            defaultViewPage.getDefaultViewWidget().selectAllRecord();
            recordDetailPage.getToolbar().clickBtnActions();
            recordDetailPage.getToolbar().selectService(Constants.BTN_DELETE);
            recordDetailPage.getPopupWidget().confirmOK();
        }
        assertThat(defaultViewPage.getDefaultViewWidget().isRecordInTableExisted()).isEqualTo(false);
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
    public TableObject getDefaultViewTable(String tblName) {
        return defaultViewPage.getDefaultViewWidget().getDefaultViewTable(tblName);

    }

    @Step
    public void select_record_with_text(String text) {
        defaultViewPage.getDefaultViewWidget().selectCheckboxWithText(text);
    }

    @Step
    public boolean verify_record_existed(String fieldName, String keyword) {
        return defaultViewPage.getDefaultViewWidget().verifyMAMEConfigRecordExisted(fieldName, keyword);
    }

    @Step
    public void select_checkbox_with_text(String label) {
        defaultViewPage.getDefaultViewWidget().selectCheckboxWithText(label);
    }
    @Step
    public void unselect_all() {
        defaultViewPage.getDefaultViewWidget().unselectAllRecord();
    }
    @Step
    public void select_all() {
        defaultViewPage.getDefaultViewWidget().selectAllRecord();
    }


    public void delete_all_record_in_displayed_table() {
        defaultViewPage.getDefaultViewWidget().selectAllRecordInDisplayedTable();
        defaultViewPage.getToolbar().clickBtnActionsDisplayed().selectService("Delete");
        defaultViewPage.getPopupWidget().confirmOK();
    }


}
