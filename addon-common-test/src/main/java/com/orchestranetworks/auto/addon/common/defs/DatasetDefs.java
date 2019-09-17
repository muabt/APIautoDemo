package com.orchestranetworks.auto.addon.common.defs;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.orchestranetworks.auto.addon.SessionData;
import com.orchestranetworks.auto.addon.common.steps.AdministrationSteps;
import com.orchestranetworks.auto.addon.common.steps.CommonSteps;
import com.orchestranetworks.auto.addon.common.steps.DatasetSteps;

import cucumber.api.DataTable;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;

@Deprecated
public class DatasetDefs {
	@Steps
	DatasetSteps onDatasetSteps;
	@Steps
	CommonSteps onCommonSteps;

	@Steps
	AdministrationSteps onAdministrationSteps;

	/**
	 * Create record with given information
	 * <p>
	 * <b>Example</b>:
	 * <ul>
	 * <font color="blue">And</font> I create record with the followings
	 *      <ul>
	 *			     <font color="green">| Identifer:TXT | Civil status:DDL | First name:TXT | Last name:TXT | Maiden name:TXT | Birth date:DATE | Gender:RADIO | Marital status:DDL | GDPR type:DDL |</font>
	 *     </ul>
	 *     <ul>
	 *			     <font color="green">|               | Dr.              | Jenifer        | Pham          |                 | 7/29/1988       | Female       | (C) Single         | Child         |</font>
	 *     </ul>
	 * </ul>
	 * </p>
	 * @param dt information of the record
	 * @throws Throwable
	 */
//	@And("^I create record with the followings$")
//	public void i_create_record_with_the_followings(DataTable dt) throws Throwable {
//		onDatasetSteps.click_btn_create_table_record();
//
//		List<List<String>> dataTable = dt.asLists(String.class);
//		List<String> header = dataTable.get(0);
//		// Get header then split to 2 element of array
//		for (int i = 0; i < header.size(); i++) {
//			String[] tmp = header.get(i).split(":");
//			// Get row of data table
//			for (int j = 1; j < dataTable.size(); j++) {
//				List<String> row = dataTable.get(j);
//				String col = tmp[0];
//				String dataType = tmp[1];
//				String cell = row.get(i);
//
//				if (!cell.isEmpty()) {
//					onDatasetSteps.input_record_field(col, cell, dataType);
//				}
//			}
//		}
//		onDatasetSteps.click_btn_save_and_close();
//	}

	/**
	 * Create a new record with given information
	 * <p>
	 * <b>Example</b>:
	 * <ul>
	 * <font color="blue">Then</font> I create a new record with credentials and PK is "<font color="green">Identifier</font>
	 *      <ul>
	 *			     <font color="green">| Identifier | Name        |</font>
	 *     </ul>
	 *     <ul>
	 *			     <font color="green">| MAX        | Noodle soup |</font>
	 *     </ul>
	 * </ul>
	 * </p>
	 * @param pkName name of PK field
	 * @param dt data of the record that user want to create
	 */
	@Then("^I create a new record with credentials and PK is \"([^\"]*)\"$")
	public void i_create_a_new_record_with_credentials_and_pk(String pkName, DataTable dt) {

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

	/**
	 * Create a data set from embedded data model
	 * <p>
	 * <b>Example</b>:
	 * <ul>
	 * <font color="blue">When</font> user wants to create data set "<font color="green">StoreDataSet</font> from an embedded data model
	 * </ul>
	 * </p>
	 * @param datasetName Name of the dataset that user want to create
	 */
	@When("^user wants to create data set \"([^\"]*)\" from an embedded data model$")
	public void user_wants_to_create_data_set_from_an_embedded_data_model(String datasetName){
		onCommonSteps.click_on_menu_dataset();
	}

	/**
	 * Access a specified table from specified group
	 * <p>
	 * <b>Example</b>:
	 * <ul>
	 * <font color="blue">And</font> I access table "<font color="green">/root/GroupA/TableA_123</font>" on group "<font color="green">/root/GroupA</font>"
	 * </ul>
	 * </p>
	 * @param tablePath path of the table
	 * @param groupPath path of the group
	 */
	@And("^I access table \"([^\"]*)\" on group \"([^\"]*)\"$")
	public void user_selects_table_on_group(String tablePath, String groupPath){
		onDatasetSteps.expand_group(groupPath);
		onDatasetSteps.select_table_on_group(tablePath);
	}

    /**
     * Put data into tables
     *
     * <p>
     * Need to check the data tables before putting any data into it.
     * Delete all the old data if it existed.
     * </p>
	 *
	 * <p>
	 * <b>Example</b>:
	 * <font color="blue">When</font> user wants to input data into table as following with the <<font color="orange">KEY</font>>
	 *     <ul>
	 *			     <font color="green">| KEY | Table       |</font>
	 *     </ul>
	 *     <ul>
	 *			     <font color="green">|  01 | Stores      |</font>
	 *     </ul>
	 *     <ul>
	 *			     <font color="green">|  02 | Categories  |</font>
	 *     </ul>
	 * </ul>
	 * </p>
     * @param dataKey key of the data in serenity session
     * @param dataTable table that user want to input new data
     */
	@When("^user wants to input data into table as following with the \"([^\"]*)\"$")
	public void user_wants_to_input_data_into_table_as_following(String dataKey,
			List<List<String>> dataTable){
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

    /**
     * Input the data to the specific tables and add the data to the serenity session
     *
	 * <p>
	 * <b>Example</b>:
	 * <font color="blue">And</font> user input data table "<font color="green">Stores</font>" as following with the "<<font color="orange">KEY</font>>"
	 *     <ul>
	 *			     <font color="green">| KEY | Identifier | Name            | Street              | City          | State | Postcode | Country       |</font>
	 *     </ul>
	 *     <ul>
	 *			     <font color="green">|  01 |          1 | Computer Market | 56 Kendall Square   | Boston        | MA    |    12870 | United States |</font>
	 *     </ul>
	 *     <ul>
	 *			     <font color="green">|  01 |          2 | Phone Depot     | 19 Brookline Avenue | Austin        | TX    |    84743 | United States |</font>
	 *     </ul>
	 * </ul>
	 * </p>
     * @param tableName name of the table that user want to input data
     * @param dataKey data key that user want to store data to session
     * @param dataTable contain data that will be input to the table
     */
	@And("^user input data table \"([^\"]*)\" as following with the \"([^\"]*)\"$")
	public void user_input_data_table_as_following(String tableName, String dataKey,
			List<List<String>> dataTable){
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

	 /**
     * I want to delete all records in the current table
     *
	 * <p>
	 * <b>Example</b>:
	 * <font color="blue">And</font> I want to delete all of record in the current table</font>>"
	 * </p>
     * @throws Throwable
     */
	/*@And("^I want to delete all of record in the current table$")
	public void detete_all_record_in_table() throws Throwable {
		onAdministrationSteps.delete_all_data_in_table_of_administrator();
	}*/

    /**
     * Create new dataset given the information
	 * <p>
	 * <b>Example</b>:
	 * <font color="blue">And</font> user creates new dataset with information as following with the "<<font color="orange">KEY</font>>"
	 *     <ul>
	 *			     <font color="green">| KEY | Publication    | Unique name  | Owner | English label | French label |</font>
	 *     </ul>
	 *     <ul>
	 *			     <font color="green">|  01 | StoreDataModel | StoreDataset |       | StoreDataset  |              |</font>
	 *     </ul>
	 *     <ul>
	 *			     <font color="green">|  02 | StoreDataModel | StoreDataset |       | StoreDataset  |              |</font>
	 *     </ul>
	 * </ul>
	 * </p>
	 * @param dataKey key to store given information in serenity session
     * @param dataTable The information of the data set
     */
	@And("^user creates new dataset with information as following with the \"([^\"]*)\"$")
	public void user_creates_new_dataset_with_information_as_following(String dataKey,
			List<List<String>> dataTable){
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

    /**
     * Confirm the data table contains the
	 * <p>
	 * <b>Example</b>:
	 * <font color="blue">And</font> the table "<font color="green">Store</font>" should be displayed as bellow with  the "<<font color="orange">KEY</font>>"
	 *     <ul>
	 *			     <font color="green">| KEY | Identifier | Name            | Street              | City          | State | Postcode | Country       |</font>
	 *     </ul>
	 *     <ul>
	 *			     <font color="green">|  01 |          1 | Computer Market | 56 Kendall Square   | Boston        | MA    |    12870 | United States |</font>
	 *     </ul>
	 *     <ul>
	 *			     <font color="green">|  01 |          2 | Phone Depot     | 19 Brookline Avenue | Austin        | TX    |    84743 | United States |</font>
	 *     </ul>
	 * </ul>
	 * </p>
	 * @param tableName name of the specifie table
     * @param dataKey dataKey to store the table in Serenity session
     * @param dataTable data to be confirmed
     */
	@Then("^the table \"([^\"]*)\" should be displayed as bellow with  the \"([^\"]*)\"$")
	public void the_table_should_be_displayed_as_bellow(String tableName, String dataKey,
			List<List<String>> dataTable){
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



    /**
     * Create a child data set of an existed data set given the information
	 * <p>
	 * <b>Example</b>:
	 * <font color="blue">When</font> I create a child of dataset of "<font color="green">Flower</font>" with credentials as following
	 *     <ul>
	 *			     <font color="green">| Unique name | Owner              | Label         |</font>
	 *     </ul>
	 *     <ul>
	 *			     <font color="green">|             | Vicky Chan (vicky) | Flowers Child |</font>
	 *     </ul>
	 * </ul>
	 * </p>
	 * @param parentDataset parent data set that user want to create child
     * @param dt List contain the information of new child data set that user want to create
     */
	@When("^I create a child of dataset of \"([^\"]*)\" with credentials as following$")
	public void user_creates_a_child_of_dataset_with_credentials_as_following(String parentDataset,
			DataTable dt){
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

    /**
     * Delete a specified dataset
	 * <p>
	 * <b>Example</b>:
	 * <ul>
	 * <font color="blue">And</font> I want to delete dataset
	 * </ul>
	 * </p>
	 * @throws Throwable
     */
	@And("^I want to delete dataset$")
	public void user_wants_to_delete_dataset() throws Throwable {
		onDatasetSteps.click_btn_action_dataset();
		onDatasetSteps.select_dataset_service("Delete");
		onDatasetSteps.confirmation_OK();
	}

	/**
	 * Duplicate a specified dataset
	 * <p>
	 * <b>Example</b>:
	 * <font color="blue">When</font> I want to duplicate a dataset from dataset followings
	 *     <ul>
	 *			     <font color="green">| Unique name        | Owner              | Label              |</font>
	 *     </ul>
	 *     <ul>
	 *			     <font color="green">| Flowers-Duplicated | Vicky Chan (vicky) | Flowers Duplicated |</font>
	 *     </ul>
	 * </ul>
	 * </p>
	 * @param dt data table
	 * @throws Throwable
	 */
	@When("^I want to duplicate a dataset from dataset followings$")
	public void i_want_to_duplicate_a_dataset_from_dataset(DataTable dt) throws Throwable {

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

	/**
	 * Verify the search result
	 * <p>
	 * <b>Example</b>:
	 * <ul>
	 * <font color="blue">Then</font> I should see the total search results "<font color="green">1 - 6 of 6</font>"
	 * </ul>
	 * </p>
	 * @param totalResult expected result that user want to verify
	 * @throws Throwable
	 */
	@Then("^I should see the total search results \"([^\"]*)\"$")
	public void i_should_see_the_total_search_results(String totalResult) throws Throwable {
		onDatasetSteps.verify_total_search_result(totalResult);
	}

	/**
	 * Verify the access table same as given information
	 * <p>
	 * <b>Example</b>:
	 * <font color="blue">When</font> the table should see as following
	 *     <ul>
	 *			     <font color="green">| ID | Email Type  | Color Type | Resource | Locale |</font>
	 *     </ul>
	 *     <ul>
	 *			     <font color="green">|  1 | a@gmail.com | '#924141'  |          | abc    |</font>
	 *     </ul>
	 * </ul>
	 * </p>
	 * @param targetTable contain information of the table that user want to verify
	 * @throws Throwable
	 */
	/*@When("^the table should see as following$")
	public void the_table_should_be_updated_with_correspond_imported_data(List<List<String>> targetTable)
			throws Throwable {
		String tblName = "TBL_EXP";
		SessionData.addDataTable(tblName, targetTable, false);
		onDatasetSteps.verify_data_table(tblName);
	}
*/
	/**
	 * Create a child data set of a given dataset
	 * <b>Example</b>:
	 * <font color="blue">And</font> I create and access to child of dataset  "<font color="green">Employee</font>"
	 * </p>
	 * @param dataset parent dataset
	 * @throws Throwable
	 */
	@And("^I create and access to child of dataset \"([^\"]*)\"$")
	public void i_create_and_access_to_child_of_dataset(String dataset) throws Throwable {
		onDatasetSteps.click_btn_change_dataset();
		onDatasetSteps.create_child_dataset(dataset);
		onDatasetSteps.click_btn_create();
		onDatasetSteps.click_btn_close();
	}

	/**
	 * Verify the popup shown with the given message
	 * <b>Example</b>:
	 * <font color="blue">Then</font> I should see the popup with error message  "<font color="green">Unable to search the empty string</font>"
	 * </p>
	 * @param content Message
	 * @throws Throwable
	 */
	@Then("^I should see the popup with error message \"([^\"]*)\"$")
	public void i_should_see_the_popup_with_error_message(String content) throws Throwable {
		onDatasetSteps.verify_warning_popup_display(content);
	}
}