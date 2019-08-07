package com.orchestranetworks.auto.addon.common.steps;

import org.junit.Assert;

import com.orchestranetworks.auto.addon.common.pages.FilterPage;

import net.thucydides.core.annotations.Step;

public class FilterSteps {
	FilterPage onFilterPage;

	@Step
	public void select_operator_of_field(String oper, String fieldName) {
		onFilterPage.select_operator_of_field(oper, fieldName);

	}

	@Step
	public void input_text_keyword(String keyword) {
		onFilterPage.input_text_keyword(keyword);
	}
	
	@Step
	public void input_search_value(String value, String type, String fieldName) {
		onFilterPage.input_search_value(value, type, fieldName);
	}

	@Step
	public void select_criteria_with_label(String criteria) {
		onFilterPage.select_search_criteria(criteria);
	}

	@Step
	public void click_btn_filter() {
		onFilterPage.click_btn_filter();
	}

	@Step
	public void click_btn_expand_with_label(String label) {
		onFilterPage.click_btn_expand_with_label(label);
	}

	@Step
	public void unselect_field_with_label(String searchType, String searchItem) {
		onFilterPage.select_field_to_search(searchType, searchItem);
	}

	@Step
	public void select_search_item(String searchType, String searchItem) {
		onFilterPage.select_field_to_search(searchType, searchItem);
	}	

	@Step
	public void input_validation_keyword(String keyword) {
		onFilterPage.input_validation_keyword(keyword);
	}

	@Step
	public void input_fuzzy_keyword(String keyword) {
		onFilterPage.input_fuzzy_keyword(keyword);
	}
	
	@Step
	public void verify_warning_popup_display(String content) {
		Assert.assertEquals("Verify popup displayed:", content, onFilterPage.get_text_popup_message());
		onFilterPage.click_btn_close_popup();
	}

	@Step
	public void click_btn_apply_text_search() {
		onFilterPage.click_btn_apply_text_search();
	}

	@Step
	public void click_btn_apply_fuzzy_search() {
		onFilterPage.click_btn_apply_fuzzy_search();
	}

	@Step
	public void click_btn_apply_validation_search() {
		onFilterPage.click_btn_apply_validation_search();
	}

	public void click_btn_apply_search() {
		onFilterPage.click_btn_apply_search();
	}

	public void select_advanced_mode() {
		onFilterPage.select_advanced_mode();
	}

	public void select_logical_search(String value) {
		onFilterPage.select_logical_search(value);
	}

}
