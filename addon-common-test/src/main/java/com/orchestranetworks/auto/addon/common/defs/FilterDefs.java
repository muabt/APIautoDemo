package com.orchestranetworks.auto.addon.common.defs;

import java.util.List;
import java.util.Map;

import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.common.steps.FilterSteps;

import cucumber.api.DataTable;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;

public class FilterDefs {
	@Steps
	FilterSteps onFilterSteps;

	/**
	 * Select filter by simple search using given criterion and logical
	 *
	 * <p>
	 * <b>Example</b>:
	 * <ul>
	 * <font color="blue">When</font> I select filter by simple search with criterion
	 *     <ul>
	 *			     <font color="green">| Criterion | Operation  | Value  | Field type |</font>
	 *     </ul>
	 *     <ul>
	 *			     <font color="green">| Identifier | =  | 23 | ENUM |</font>
	 *     </ul>
	 *     <ul>
	 *			     <font color="green">| Email | startsWith  | a | INPUT |</font>
	 *     </ul>
	 * </ul>
	 * </p>
	 * @param dt the criterion and logical used for search
	 * @throws Throwable
	 */
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

	/**
	 * Select filter by advanced search using given criterion and logical
	 * <p>
	 * <b>Example</b>:
	 * <font color="blue">When</font> I select filter by simple search with criterion "<font color="green">All criteria match</font>"
	 *     <ul>
	 *			     <font color="green">| Criterion | Operation  | Value  | Field type |</font>
	 *     </ul>
	 *     <ul>
	 *			     <font color="green">| Identifier | =  | 23 | ENUM |</font>
	 *     </ul>
	 *     <ul>
	 *			     <font color="green">| Email | startsWith  | a | INPUT |</font>
	 *     </ul>
	 * </ul>
	 * </p>
	 * @param logical logical mode of advanced search
	 * @param dt List of criterion that user want to use
	 * @throws Throwable
	 */
	@When("^I select filter by advanced search with criterion and logical \"([^\"]*)\"$")
	public void i_select_filter_by_advanced_search_with_criterion_and_logical(String logical, DataTable dt)
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

	/**
	 * Select filter by advanced search using given logical
	 * <p>
	 * <b>Example</b>:
	 * <font color="blue">Given</font> I access dataspace "<font color="green">FastTrack>[03] Parties data>Company employees</font>"
	 *     <ul>
	 *			     <font color="green">| Logical | Criterion | Operation  | Value  | Field type |</font>
	 *     </ul>
	 *     <ul>
	 *			     <font color="green">| At least one criterion matches | Identifier | =  | 23 | INPUT |</font>
	 *     </ul>
	 *     <ul>
	 *			     <font color="green">| Not all criteria match | Person |   | Aaron Eaton | ENUM |</font>
	 *     </ul>
	 * </ul>
	 * </p>
	 * @param dt List of criterion that user want to use
	 * @throws Throwable
	 */
	// TODO : Need refactor after handle selected=on attribute iblockn DDL
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

	/**
	 * Select the filter by using given text and field
	 *
	 * <p>
	 * <b>Example</b>:
	 * <font color="blue">When</font> I select filter by text with keyword and field below
	 *     <ul>
	 *			     <font color="green">| Field contains: | In fields             |</font>
	 *     </ul>
	 *     <ul>
	 *			     <font color="green">| Big Mac         | ID, Name, Description |</font>
	 *     </ul>
	 * </ul>
	 * </p>
	 * @param dt data to used to select filter
	 * @throws Throwable
	 */
//	@When("^I select filter by text with keyword and field below$")
//	public void i_select_filter_by_text_with_keyword_and_field_below(DataTable dt) throws Throwable {
//		onFilterSteps.click_btn_filter();
//		onFilterSteps.click_btn_expand_with_label(Constants.TEXT_SEARCH);
//		onFilterSteps.unselect_field_with_label(Constants.TEXT_SEARCH, "Select all");
//		List<Map<String, String>> list = dt.asMaps(String.class, String.class);
//		Map<String, String> row = list.get(0);
//
//		String fieldContains = row.get("Field contains:");
//		String inField = row.get("In fields");
//
//		if (!fieldContains.isEmpty()) {
//			onFilterSteps.input_text_keyword(fieldContains);
//		}
//
//		if (!inField.isEmpty()) {
//			String[] item = inField.split(",");
//			for (int i = 0; i < item.length; i++) {
//				onFilterSteps.select_search_item(Constants.TEXT_SEARCH, item[i].trim());
//			}
//		} else {
//			onFilterSteps.select_search_item(Constants.TEXT_SEARCH, "Select all");
//
//		}
//		onFilterSteps.click_btn_apply_text_search();
//	}

	/**
	 * Select the filter in fuzzy search using given keyword
	 *
	 * <p>
	 * <b>Example</b>:
	 * <font color="blue">When</font> I select filter by fuzzy search with keyword and field below
	 *     <ul>
	 *			     <font color="green">| Record contains: | Fields        |</font>
	 *     </ul>
	 *     <ul>
	 *			     <font color="green">|                  | Email, Person |</font>
	 *     </ul>
	 * </ul>
	 * </p>
	 * @param dt
	 * @throws Throwable
	 */
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

	/**
	 * Select filter by validation using the given keyword and field
	 * <p>
	 * <b>Example</b>:
	 * <font color="blue">When</font> I select filter by validation with keyword and field below
	 *     <ul>
	 *			     <font color="green">| Message contains: | Severity         |</font>
	 *     </ul>
	 *     <ul>
	 *			     <font color="green">| start with 'a'    | Errors, Warnings |</font>
	 *     </ul>
	 * </ul>
	 * </p>
	 * @param dt keyword and field use for search
	 * @throws Throwable
	 */
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
