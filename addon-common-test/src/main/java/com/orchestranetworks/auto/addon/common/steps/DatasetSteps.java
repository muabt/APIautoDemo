package com.orchestranetworks.auto.addon.common.steps;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Assert;

import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.SessionData;
import com.orchestranetworks.auto.addon.common.pages.DatasetPage;

import net.thucydides.core.annotations.Step;

public class DatasetSteps {

    DatasetPage onDatasetPage;

    @Step
    public void go_to_dataspace(String path) {
        onDatasetPage.remove_choose_dataset_div();
        onDatasetPage.click_btn_change_dataspace();
        onDatasetPage.go_to_navigation(path);
    }

    @Step
    public void remove_choose_dataset_div() {
        onDatasetPage.remove_choose_dataset_div();
    }

    @Step
    public void select_data_set(String datasetName) {
        onDatasetPage.go_to_navigation(datasetName);
    }

    @Step
    public void go_to_data_set(String path) {
        onDatasetPage.switchOutDefaultIFrame();
        onDatasetPage.click_btn_change_dataset();
        onDatasetPage.go_to_navigation(path);
    }

    @Step
    public void click_btn_action_dataset() {
        onDatasetPage.click_btn_action_dataset();
    }

    @Step
    public void click_btn_action_table() {
        onDatasetPage.click_btn_action_table();
    }

    @Step
    public void select_dataset_service(String service) {
        onDatasetPage.select_dataset_service(service);
    }

    @Step
    public void select_table(String tableName) {
        onDatasetPage.select_table(tableName);
    }

    @Step
    public void expand_group(String groupPath) {
        onDatasetPage.go_to_group(groupPath);
        // onDatasetPage.selectNavigationMenuGroupItem(groupPath);

    }

    @Step
    public void select_table_on_group(String tablePath) {
        onDatasetPage.selectNavigationMenuGroupItem1(tablePath);

    }

	/*@Step
	public void select_record_with_PK(String recordID) {
		if (recordID.contains("|")) {
			String[] ids = recordID.split("\\|");
			onDatasetPage.select_record_with_PK(ids);
		} else {
			onDatasetPage.select_record_with_PK(recordID);
		}
	}

	@Step
	public void select_record_with_PK(String[] recordPKs) {
		onDatasetPage.select_record_with_PK(recordPKs);

	}*/

    @Step
    public void select_table_service(String service) {
        onDatasetPage.select_table_service(service);
    }

    @Step
    public void click_on_table_name(String sTable) {
        onDatasetPage.click_on_table(sTable);
    }

    @Step
    public void delete_all_data_in_table() {
        if (onDatasetPage.exist_record_in_table()) {
            onDatasetPage.click_btn_select_and_sort();
            onDatasetPage.select_all_record();
            onDatasetPage.click_btn_action_table();
            onDatasetPage.select_table_service(Constants.BTN_DELETE);
            onDatasetPage.confirmPopupOK();
        }

    }

    @Step
    public void switch_to_iframe(String id) {
        onDatasetPage.switchToIFrame(id);
    }

    @Step
    public void click_btn_add_new_record() {
        onDatasetPage.click_btn_add_new_record();

    }

    @Step
    public void enter_input_with_label(String label, String value) {
        switch (onDatasetPage.check_field_type(label)) {
            case "INPUT":
                onDatasetPage.waitTypeAndTabWithLabel(label, value);
                break;
            case "DDL":
                onDatasetPage.selectDDLInput(label, value);
                break;
            case "RADIO":
                onDatasetPage.selectRadioBoxGroup(label, value);
                break;
            default:
                break;
        }

    }

    @Step
    public void select_ddl_with_label(String label, String value) {
        onDatasetPage.selectDDLBox(label, value);

    }

    @Step
    public void click_btn_save_and_close() {
        onDatasetPage.click_btn_save_and_close();
    }

    public void click_btn_close() {
        onDatasetPage.click_btn_close();
    }

    @Step
    public boolean data_set_existed(String sUniqueName) {
        onDatasetPage.click_btn_change_dataset();
        return onDatasetPage.data_set_existed(sUniqueName);
    }

    @Step
    public void click_btn_create_new_dataset() {
        onDatasetPage.click_btn_create_new_dataset();

    }

    @Step
    public void select_data_model_type(String dataModelType) {
        onDatasetPage.click_btn_data_model_type(dataModelType);

    }

    @Step
    public void select_publication(String sPublication) {
        onDatasetPage.select_publication(sPublication);

    }

    @Step
    public void click_btn_next() {
        onDatasetPage.click_btn_next();

    }

    @Step
    public void enter_dataset_name(String sUniqueName) {
        onDatasetPage.enter_unique_name(sUniqueName);

    }

    @Step
    public void enter_english_label(String sEnglishLabel) {
        onDatasetPage.enter_english_label(sEnglishLabel);

    }

    @Step
    public void click_btn_create() {
        onDatasetPage.click_btn_create();

    }

    @Step
    public void verify_data_cell(String rowCode, String colCode, String value) {
        Assert.assertEquals(value.trim(), onDatasetPage.get_text_data_cell(rowCode, colCode));
    }

    @Step
    public void click_on_permission() {
        onDatasetPage.click_btn_permissions();
    }

    // TODO need refactor method name
    @Step
    public void click_on_createnewrecord() {
        onDatasetPage.click_btn_add_new_record();
    }

    @Step
    public void choose_profile() {
        onDatasetPage.click_profile();
        onDatasetPage.choose_profile();

    }

    @Step
    public void choose_policy() {

    }

    @Step
    public void click_btn_create_child_dataset(String parentDataset) {
        onDatasetPage.click_btn_create_child_dataset(parentDataset);
    }

    @Step
    public void click_btn_change_dataset() {
        onDatasetPage.click_btn_change_dataset();
    }

    @Step
    public void confirmation_OK() {
        onDatasetPage.confirmation_OK();
    }

    @Step
    public void select_dataset_owner(String owner) {
        onDatasetPage.select_dataset_owner(owner);

    }

    @Step
    public void select_first_records(String numOfRecord) {
        onDatasetPage.select_first_records(Integer.parseInt(numOfRecord));

    }

    @Step
    public void create_child_dataset(String parent) {
        onDatasetPage.create_child_dataset(parent);
    }

    @Step
    public void click_btn_duplicate() {
        onDatasetPage.click_btn_duplicate();
    }

    @Step
    public void input_record_field(String col, String cell, String dataType) {
        onDatasetPage.input_field_content(col, cell, dataType);
    }

    // TODO same method with click_on_createnewrecord
    @Step
    public void click_btn_create_table_record() {
        onDatasetPage.click_btn_create_record();
    }

    @Step
    public void create_id_of_record(String nameOfPkField) {
        String lastestId = onDatasetPage.get_text_cell(nameOfPkField);
        int id = Integer.parseInt(lastestId) + 1;
        lastestId = Integer.toString(id);

        onDatasetPage.click_btn_create_record();
        onDatasetPage.input_table_record_with_label(nameOfPkField, lastestId);
    }

    @Step
    public void input_table_record_with_label(String label, String name) {
        onDatasetPage.input_table_record_with_label(label, name);
    }

    @Step
    public void sort_table_record_descending_with_field_name(String fieldName) {
        onDatasetPage.click_to_sort_in_descending_order_for_field(fieldName);
    }

    @Step
    public void verify_total_search_result(String expectedResult) {
        String actualResult = onDatasetPage.get_total_search_result();
        assertEquals(expectedResult, actualResult);
    }

//	@Step
//	public void verify_data_table(String expTable) {
//		List<List<String>> actualTable = onDatasetPage.getTableData();
//		SessionData.addDataTable("RECORD_VIEW_ACT", actualTable, false);
//		// assertEquals(expTable, actualTable);
//		SessionData.compareTableNotFixHeader(expTable, "RECORD_VIEW_ACT");
//	}

    @Step
    public void verify_warning_popup_display(String content) {
        Assert.assertEquals(content, onDatasetPage.get_text_popup_message());
        onDatasetPage.click_btn_close_popup();
        onDatasetPage.switchToIFrame(Constants.IFRAME_LEGACY);
    }

    @Step
    public void verify_warning_popup_display_contains(String content) {
        Assert.assertTrue("Verify popup displayed: ", onDatasetPage.get_text_popup_message().contains(content));
        onDatasetPage.click_btn_close_popup();
        onDatasetPage.switchToIFrame(Constants.IFRAME_LEGACY);
    }

    public void click_btn_export() {
        onDatasetPage.click_btn_export();
    }

    public void click_btn_close_popup() {
        onDatasetPage.close_popup_with_frame();

    }


	public void click_btn_create_record() {

	}
}
