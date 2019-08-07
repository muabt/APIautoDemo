package com.orchestranetworks.auto.addon.common.defs;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.orchestranetworks.auto.addon.SessionData;
import com.orchestranetworks.auto.addon.common.steps.CommonSteps;
import com.orchestranetworks.auto.addon.common.steps.DatasetSteps;

import cucumber.api.DataTable;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;

public class DatasetDefs {
	@Steps
	DatasetSteps onDatasetSteps;
	@Steps
	CommonSteps onCommonSteps;

	@When("^I access dataspace \"([^\"]*)\"$")
	public void user_accesses_dataspace(String path) throws Exception {
		onDatasetSteps.go_to_dataspace(path);
	}

	@When("^I access dataset \"([^\"]*)\"$")
	public void user_accesses_data_set(String datasetName) throws Exception {
		onDatasetSteps.go_to_data_set(datasetName);
	}

	@And("^I create record with the followings$")
	public void i_create_record_with_the_followings(DataTable dt) throws Throwable {
		onDatasetSteps.click_btn_create_table_record();

		List<List<String>> dataTable = dt.asLists(String.class);
		List<String> header = dataTable.get(0);
		// Get header then split to 2 element of array
		for (int i = 0; i < header.size(); i++) {
			String[] tmp = header.get(i).split(":");
			// Get row of data table
			for (int j = 1; j < dataTable.size(); j++) {
				List<String> row = dataTable.get(j);
				String col = tmp[0];
				String dataType = tmp[1];
				String cell = row.get(i);

				if (!cell.isEmpty()) {
					onDatasetSteps.input_record_field(col, cell, dataType);
				}
			}
		}
		onDatasetSteps.click_btn_save_and_close();
	}

	@Then("^I create a new record with credentials and PK is \"([^\"]*)\"$")
	public void i_create_a_new_record_with_credentials_and_pk_is_something(String pkName, DataTable dt) {

		List<Map<String, String>> dataTable = dt.asMaps(String.class, String.class);
		Map<String, String> row = dataTable.get(0);
		String name = row.get("Name");

		// Sort descending to get the latest id
		onDatasetSteps.sort_table_record_descending_with_field_name(pkName);

		// Create id for record
		onDatasetSteps.create_id_of_record(pkName);

		if (!name.isEmpty()) {
			onDatasetSteps.input_table_record_with_label("Name", name);
		}
		onDatasetSteps.click_btn_save_and_close();
	}

	@When("^user wants to create data set \"([^\"]*)\" from an embedded data model$")
	public void user_wants_to_create_data_set_something_from_an_embedded_data_model(String datasetName)
			throws Throwable {
		onCommonSteps.click_on_menu_dataset();

	}

	@And("^I access table \"([^\"]*)\" on group \"([^\"]*)\"$")
	public void user_selects_table_something_on_group_something(String tablePath, String groupPath) throws Throwable {
		onDatasetSteps.expand_group(groupPath);
		onDatasetSteps.select_table_on_group(tablePath);
	}

	@When("^user wants to input data into table as following with the \"([^\"]*)\"$")
	public void user_wants_to_input_data_into_table_as_following_with_the_something(String dataKey,
			List<List<String>> dataTable) throws Throwable {
		SessionData.addDataTable("TABLENAME_TBL", dataTable, false);
		LinkedHashMap<Integer, List<String>> testData = new LinkedHashMap<>();
		testData = SessionData.getDataTbRowsByValEqualInCol("TABLENAME_TBL", "KEY", dataKey);
		for (int row : testData.keySet()) {
			String sTable = SessionData.getDataTbVal("TABLENAME_TBL", row, "Table");
			if (!sTable.isEmpty()) {
				onDatasetSteps.click_on_table_name(sTable);
				onDatasetSteps.delete_all_data_in_table();
			}
		}

	}

	@And("^user input data table \"([^\"]*)\" as following with the \"([^\"]*)\"$")
	public void user_input_data_table_as_following_with_the_something(String tableName, String dataKey,
			List<List<String>> dataTable) throws Throwable {
		SessionData.addDataTable("TABLE_TBL", dataTable, false);
		LinkedHashMap<Integer, List<String>> testData = new LinkedHashMap<>();
		testData = SessionData.getDataTbRowsByValEqualInCol("TABLE_TBL", "KEY", dataKey);
		if (!testData.isEmpty()) {
			onDatasetSteps.click_on_table_name(tableName);
			onDatasetSteps.delete_all_data_in_table();
			List<String> colList = SessionData.getDataTbRowByRowIndex("TABLE_TBL", 0);
			for (int row : testData.keySet()) {
				onDatasetSteps.click_btn_add_new_record();
				for (int i = 1; i < colList.size(); i++) {
					String col = SessionData.getDataTbColName("TABLE_TBL", i);
					String tableValue = SessionData.getDataTbVal("TABLE_TBL", row, col);
					if (!tableValue.isEmpty()) {
						onDatasetSteps.enter_input_with_label(col, tableValue);
					}
				}
				onDatasetSteps.click_btn_save_and_close();
			}
		}
	}

	@And("^user creates new dataset with information as following with the \"([^\"]*)\"$")
	public void user_creates_new_dataset_with_information_as_following_with_the_something(String dataKey,
			List<List<String>> dataTable) throws Throwable {
		SessionData.addDataTable("DATASET_TBL", dataTable, false);
		LinkedHashMap<Integer, List<String>> testData = new LinkedHashMap<>();
		testData = SessionData.getDataTbRowsByValEqualInCol("DATASET_TBL", "KEY", dataKey);
		for (int row : testData.keySet()) {
			String sPublication = SessionData.getDataTbVal("DATASET_TBL", row, "Publication");
			String sOwner = SessionData.getDataTbVal("DATASET_TBL", row, "Owner");
			String sUniqueName = SessionData.getDataTbVal("DATASET_TBL", row, "Unique name");
			String sEnglishLabel = SessionData.getDataTbVal("DATASET_TBL", row, "English label");
			String sFrenchLabel = SessionData.getDataTbVal("DATASET_TBL", row, "French label");

			if (onDatasetSteps.data_set_existed(sUniqueName)) {
				onDatasetSteps.select_data_set(sUniqueName);
			} else {
				onDatasetSteps.click_btn_create_new_dataset();
				onDatasetSteps.select_data_model_type("Embedded data model");

				if (!sPublication.isEmpty()) {
					onDatasetSteps.select_publication(sPublication);
				}
				onDatasetSteps.click_btn_next();
				if (!sOwner.isEmpty()) {

				}
				if (!sUniqueName.isEmpty()) {
					onDatasetSteps.enter_dataset_name(sUniqueName);
				}
				if (!sEnglishLabel.isEmpty()) {
					onDatasetSteps.enter_english_label(sEnglishLabel);
				}
				if (!sFrenchLabel.isEmpty()) {
				}
				onDatasetSteps.click_btn_create();
			}
		}
	}

	@Then("^the table \"([^\"]*)\" should be displayed as bellow with  the \"([^\"]*)\"$")
	public void the_table_something_should_be_displayed_as_bellow_with_the_something(String tableName, String dataKey,
			List<List<String>> dataTable) throws Throwable {
		String dataTableKey = "VERIFY_TBL";
		SessionData.addDataTable(dataTableKey, dataTable, false);
		LinkedHashMap<Integer, List<String>> testData = new LinkedHashMap<>();
		testData = SessionData.getDataTbRowsByValEqualInCol(dataTableKey, "KEY", dataKey);
		if (!testData.isEmpty()) {
			onDatasetSteps.click_on_table_name(tableName);
			List<String> colList = SessionData.getDataTbRowByRowIndex(dataTableKey, 0);
			for (int row : testData.keySet()) {
				for (int i = 2; i < colList.size(); i++) {
					String colIdentifier = SessionData.getDataTbColName(dataTableKey, 1);
					String colName = SessionData.getDataTbColName(dataTableKey, i);

					String identifier = SessionData.getDataTbVal(dataTableKey, row, colIdentifier);
					String tableValue = SessionData.getDataTbVal(dataTableKey, row, colName);
					if (!tableValue.isEmpty()) {
						onDatasetSteps.verify_data_cell(identifier, colName, tableValue);
					}
				}
			}
		}
	}

	@When("^I select first \"([^\"]*)\" records in table$")
	public void user_selects_first_something_records_in_table(String numOfRecord) throws Throwable {
		onDatasetSteps.select_first_records(numOfRecord);

	}

	@When("^I select some records as following$")
	public void user_selects_records_as_following(DataTable dt) throws Throwable {
	}

	@When("^I create a child of dataset of \"([^\"]*)\" with credentials as following$")
	public void user_creates_a_child_of_dataset_of_something_with_credentials_as_following(String parentDataset,
			DataTable dt) throws Throwable {
		List<Map<String, String>> dataTable = dt.asMaps(String.class, String.class);
		onDatasetSteps.click_btn_change_dataset();
		Map<String, String> row = dataTable.get(0);
		String uniqueName = row.get("Unique name");
		String owner = row.get("Owner");
		String label = row.get("Label");

		if (!uniqueName.isEmpty()) {
			onDatasetSteps.click_btn_create_child_dataset(parentDataset);
			onDatasetSteps.enter_dataset_name(uniqueName);
		} else {
			onDatasetSteps.create_child_dataset(parentDataset);
		}
		if (!owner.isEmpty()) {
			onDatasetSteps.select_dataset_owner(owner);

		}
		if (!label.isEmpty()) {
			onDatasetSteps.enter_english_label(label);
		}
		onDatasetSteps.click_btn_create();
		onDatasetSteps.click_btn_close();
	}

	@And("^I access table \"([^\"]*)\"$")
	public void user_accesses_table_something(String tblName) throws Throwable {
		onDatasetSteps.click_on_table_name(tblName);
	}

	@And("^I select table service \"([^\"]*)\"$")
	public void user_select_table_service_something(String service) throws Throwable {
		onDatasetSteps.click_btn_action_table();
		onDatasetSteps.select_table_service(service);
	}

	@And("^I want to delete dataset$")
	public void user_wants_to_delete_dataset_something() throws Throwable {
		onDatasetSteps.click_btn_action_dataset();
		onDatasetSteps.select_dataset_service("Delete");
		onDatasetSteps.confirmation_OK();
	}
	
	@When("^I want to duplicate a dataset from dataset followings$")
	public void i_want_to_duplicate_a_dataset_from_dataset_followings(DataTable dt)
			throws Throwable {

		onDatasetSteps.select_dataset_service("Actions>Duplicate");

		List<Map<String, String>> dataTable = dt.asMaps(String.class, String.class);

		Map<String, String> row = dataTable.get(0);
		String uniqueName = row.get("Unique name");
		String owner = row.get("Owner");
		String label = row.get("Label");

		if (!uniqueName.isEmpty()) {
			onDatasetSteps.enter_dataset_name(uniqueName);
		}
		if (!owner.isEmpty()) {
			onDatasetSteps.select_dataset_owner(owner);

		}
		if (!label.isEmpty()) {
			onDatasetSteps.enter_english_label(label);
		}
		onDatasetSteps.click_btn_duplicate();
		onDatasetSteps.confirmation_OK();
	}

	@Then("^I should see the total search results \"([^\"]*)\"$")
	public void i_should_see_the_total_search_results_something(String totalResult) throws Throwable {
		onDatasetSteps.verify_total_search_result(totalResult);
	}

}
