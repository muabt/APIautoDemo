package com.orchestranetworks.auto.addon.common.defs;

import java.util.List;
import java.util.Map;

import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.common.steps.FilterSteps;

import cucumber.api.DataTable;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;

public class FilterDefs {
	@Steps
	FilterSteps onFilterSteps;

	@When("^I select filter by simple search with criterion$")
	public void i_select_filter_by_simple_search_with_criterion(DataTable dt) throws Throwable {
		onFilterSteps.click_btn_filter();

		List<Map<String, String>> list = dt.asMaps(String.class, String.class);
		for (int i = 0; i < list.size(); i++) {
			Map<String, String> row = list.get(i);
			String criterion = row.get("Criterion");
			String oper = row.get("Operation");
			String value = row.get("Value");
			String type = row.get("Field type");

			onFilterSteps.select_criteria_with_label(criterion);

			if (!oper.isEmpty()) {
				onFilterSteps.select_operator_of_field(oper, criterion);
			}

			if (!value.isEmpty()) {
				String[] itemList = value.split(",");
				for (int j = 0; j < itemList.length; j++) {
					onFilterSteps.input_search_value(itemList[j].trim(), type, criterion);
				}
			}
		}
		onFilterSteps.click_btn_apply_search();
	}

	@When("^I select filter by advanced search with criterion and logical \"([^\"]*)\"$")
	public void i_select_filter_by_advanced_search_with_criterion_and_logical_something(String logical, DataTable dt)
			throws Throwable {
		onFilterSteps.click_btn_filter();
		onFilterSteps.select_advanced_mode();
		onFilterSteps.select_logical_search(logical);

		List<Map<String, String>> list = dt.asMaps(String.class, String.class);
		for (int i = 0; i < list.size(); i++) {
			Map<String, String> row = list.get(i);
			String criterion = row.get("Criterion");
			String oper = row.get("Operation");
			String value = row.get("Value");
			String type = row.get("Field type");

			onFilterSteps.select_criteria_with_label(criterion);

			if (!oper.isEmpty()) {
				onFilterSteps.select_operator_of_field(oper, criterion);
			}

			if (!value.isEmpty()) {
				String[] itemList = value.split(",");
				for (int j = 0; j < itemList.length; j++) {
					onFilterSteps.input_search_value(itemList[j].trim(), type, criterion);
				}
			}
		}
		onFilterSteps.click_btn_apply_search();
	}

	// TODO : Need refactor after handle selected=on attribute in DDL
	@When("^I select filter by advanced search with logical block$")
	public void i_select_filter_by_advanced_search_with_logical_block(DataTable dt) throws Throwable {
		onFilterSteps.click_btn_filter();
		onFilterSteps.select_advanced_mode();

		List<Map<String, String>> list = dt.asMaps(String.class, String.class);
		for (int i = 0; i < list.size(); i++) {
			Map<String, String> row = list.get(i);
			String logical = row.get("Logical");
			String criterion = row.get("Criterion");
			String oper = row.get("Operation");
			String value = row.get("Value");
			String type = row.get("Field type");
			
			onFilterSteps.add_logical_block();
			if (!criterion.isEmpty()) {
				onFilterSteps.select_logical_block_info(logical, criterion);
				if (!oper.isEmpty()) {
					onFilterSteps.select_operator_of_field(oper, criterion);
				}
				if (!value.isEmpty()) {
					String[] itemList = value.split(",");
					for (int j = 0; j < itemList.length; j++) {
						onFilterSteps.input_search_value(itemList[j].trim(), type, criterion);
					}
					onFilterSteps.click_btn_add();
				}
			}
		}
		onFilterSteps.click_btn_apply_search();
	}

	@When("^I select filter by text with keyword and field below$")
	public void i_select_filter_by_text_with_keyword_and_field_below(DataTable dt) throws Throwable {
		onFilterSteps.click_btn_filter();
		onFilterSteps.click_btn_expand_with_label(Constants.TEXT_SEARCH);
		onFilterSteps.unselect_field_with_label(Constants.TEXT_SEARCH, "Select all");
		List<Map<String, String>> list = dt.asMaps(String.class, String.class);
		Map<String, String> row = list.get(0);

		String fieldContains = row.get("Field contains:");
		String inField = row.get("In fields");

		if (!fieldContains.isEmpty()) {
			onFilterSteps.input_text_keyword(fieldContains);
		}

		if (!inField.isEmpty()) {
			String[] item = inField.split(",");
			for (int i = 0; i < item.length; i++) {
				onFilterSteps.select_search_item(Constants.TEXT_SEARCH, item[i].trim());
			}
		} else {
			onFilterSteps.select_search_item(Constants.TEXT_SEARCH, "Select all");

		}
		onFilterSteps.click_btn_apply_text_search();
	}

	@When("^I select filter by fuzzy search with keyword and field below$")
	public void i_select_filter_by_fuzzy_search_with_keyword_and_field_below(DataTable dt) throws Throwable {
		onFilterSteps.click_btn_filter();
		onFilterSteps.click_btn_expand_with_label(Constants.FUZZY_SEARCH);
		onFilterSteps.unselect_field_with_label(Constants.FUZZY_SEARCH, "Select all");

		List<Map<String, String>> list = dt.asMaps(String.class, String.class);
		Map<String, String> row = list.get(0);

		String recordContains = row.get("Record contains:");
		String fields = row.get("Fields");

		if (!fields.isEmpty()) {
			String[] item = fields.split(",");
			for (int i = 0; i < item.length; i++) {
				onFilterSteps.select_search_item(Constants.FUZZY_SEARCH, item[i].trim());
			}
		}

		if (!recordContains.isEmpty()) {
			onFilterSteps.input_fuzzy_keyword(recordContains);
		}
		onFilterSteps.click_btn_apply_fuzzy_search();
	}

	@Then("^I should see the popup with error message \"([^\"]*)\"$")
	public void i_should_see_the_popup_with_error_message_something(String content) throws Throwable {
		onFilterSteps.verify_warning_popup_display(content);
	}

	@When("^I select filter by validation with keyword and field below$")
	public void i_select_filter_by_validation_with_keyword_and_field_below(DataTable dt) throws Throwable {
		onFilterSteps.click_btn_filter();
		onFilterSteps.click_btn_expand_with_label(Constants.VALIDATION_SEARCH);
		onFilterSteps.unselect_field_with_label(Constants.VALIDATION_SEARCH, "Errors");

		List<Map<String, String>> list = dt.asMaps(String.class, String.class);
		Map<String, String> row = list.get(0);

		String msgContains = row.get("Message contains:");
		String severity = row.get("Severity");

		if (!msgContains.isEmpty()) {
			onFilterSteps.input_validation_keyword(msgContains);

		}

		if (!severity.isEmpty()) {
			String[] itemList = severity.split(",");
			for (int i = 0; i < itemList.length; i++) {
				onFilterSteps.select_search_item(Constants.VALIDATION_SEARCH, itemList[i].trim());
			}
		}
		onFilterSteps.click_btn_apply_validation_search();
	}

}
