package com.orchestranetworks.auto.addon.common.steps;

import static org.junit.Assert.assertEquals;

import org.junit.Assert;

import com.orchestranetworks.auto.addon.Constants;
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
	public void select_data_set(String datasetName) {
		onDatasetPage.go_to_navigation(datasetName);
	}

	@Step
	public void go_to_data_set(String path) {
		onDatasetPage.click_btn_change_dataset();
		onDatasetPage.go_to_navigation(path);
	}

	@Step
	public void input_search_keyword_in_text_search(String keyword) {
		onDatasetPage.input_search_keyword_in_text_search(keyword);
	}

	@Step
	public void input_search_keyword_in_validation_search(String keyword) {
		onDatasetPage.input_search_keyword_in_validation_search(keyword);
	}

	@Step
	public void input_search_keyword_in_fuzzy_search(String keyword) {
		onDatasetPage.input_search_keyword_in_fuzzy_search(keyword);
	}

	@Step
	public void click_btn_filter() {
		onDatasetPage.click_btn_filter();
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

	@Step
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

	}

	@Step
	public void select_table_service(String service) {
		onDatasetPage.select_table_service(service);
	}

	@Step
	public void verify_warning_popup_display(String content) {
		Assert.assertEquals("Verify popup displayed:", content, onDatasetPage.get_text_popup_message());
		onDatasetPage.click_btn_close_popup();
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
	public void click_btn_expand_with_label(String label) {
		onDatasetPage.click_btn_expand_with_label(label);
	}

	@Step
	public void unselect_field_with_label(String searchType, String searchItem) {
		onDatasetPage.select_field_to_search(searchType, searchItem);
	}

	@Step
	public void select_search_item(String searchType, String searchItem) {
		onDatasetPage.select_field_to_search(searchType, searchItem);
	}

	@Step
	public void click_btn_apply_text_search() {
		onDatasetPage.click_btn_apply_text_search();
	}

	@Step
	public void click_btn_apply_fuzzy_search() {
		onDatasetPage.click_btn_apply_fuzzy_search();
	}

	@Step
	public void click_btn_apply_validation_search() {
		onDatasetPage.click_btn_apply_validation_search();
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
}
