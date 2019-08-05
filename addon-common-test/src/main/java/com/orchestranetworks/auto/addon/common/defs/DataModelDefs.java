package com.orchestranetworks.auto.addon.common.defs;

import java.util.LinkedHashMap;
import java.util.List;

import com.orchestranetworks.auto.addon.SessionData;
import com.orchestranetworks.auto.addon.common.steps.DataModelSteps;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;

public class DataModelDefs {
	@Steps
	DataModelSteps onDataModelSteps;
	@Steps
	DatasetDefs onDatasetDefs;

	@Given("^I access data model \"([^\"]*)\"$")
		public void user_accesses_data_model(String path) throws Exception {
		onDataModelSteps.select_data_model(path);
		}
	@When("^user want to create new Data Model has the name \"([^\"]*)\"$")
	public void user_want_to_create_new_data_model_has_the_name_something(String dataModelName) {
		onDataModelSteps.click_on_menu_data_models();
		onDataModelSteps.create_new_data_model(dataModelName);
	}

	@When("^user want to select Data Model has the name \"([^\"]*)\"$")
	public void user_want_to_select_data_model_has_the_name_something(String dataModelName) {
		onDataModelSteps.click_on_menu_data_models();
		onDataModelSteps.select_data_model(dataModelName);
	}

	@And("^user creates tables with information as following with the \"([^\"]*)\"$")
	public void user_creates_tables_with_information_as_following_with_the_something(String dataKey,
			List<List<String>> dataTable) throws Throwable {
		SessionData.addDataTable("TABLE_TBL", dataTable, false);
		LinkedHashMap<Integer, List<String>> testData = new LinkedHashMap<>();
		testData = SessionData.getDataTbRowsByValEqualInCol("TABLE_TBL", "KEY", dataKey);
		for (int row : testData.keySet()) {
			String sKey = SessionData.getDataTbVal("TABLE_TBL", row, "KEY");
			String sTableName = SessionData.getDataTbVal("TABLE_TBL", row, "Name");
			String sEnglishLabel = SessionData.getDataTbVal("TABLE_TBL", row, "Label and description English");
			String sFrenchLabel = SessionData.getDataTbVal("TABLE_TBL", row, "French");
			String sKindOfElement = SessionData.getDataTbVal("TABLE_TBL", row, "Kind of element");
			if (!sKey.isEmpty()) {
				onDataModelSteps.create_table();
			}
			if (!sTableName.isEmpty()) {
				onDataModelSteps.enter_element_name(sTableName);
			}
			if (!sEnglishLabel.isEmpty()) {
				onDataModelSteps.enter_english_label(sEnglishLabel);
			}
			if (!sFrenchLabel.isEmpty()) {
				onDataModelSteps.enter_french_label(sFrenchLabel);
			}
			if (!sKindOfElement.isEmpty()) {
				onDataModelSteps.select_kind_of_element(sKindOfElement);
			}
			onDataModelSteps.click_btn_create();
		}
	}

	@And("^user creates element as following with the \"([^\"]*)\"$")
	public void user_creates_element_for_table_as_following_with_the_something(String dataKey,
			List<List<String>> dataTable) throws Throwable {
		String table = "";
		SessionData.addDataTable("FIELD_TBL", dataTable, false);
		LinkedHashMap<Integer, List<String>> testData = new LinkedHashMap<>();
		testData = SessionData.getDataTbRowsByValEqualInCol("FIELD_TBL", "KEY", dataKey);
		for (int row : testData.keySet()) {
			String sTableName = SessionData.getDataTbVal("FIELD_TBL", row, "Table name");
			String sFieldName = SessionData.getDataTbVal("FIELD_TBL", row, "Field name");
			String sEnglishLabel = SessionData.getDataTbVal("FIELD_TBL", row, "Label and description English");
			String sFrenchLabel = SessionData.getDataTbVal("FIELD_TBL", row, "French");
			String sKindOfElement = SessionData.getDataTbVal("FIELD_TBL", row, "Kind of element");
			String sReferencedTable = SessionData.getDataTbVal("FIELD_TBL", row, "Referenced table");
			String sForeignKeyToCurrentTable = SessionData.getDataTbVal("FIELD_TBL", row,
					"Foreign key to current table");
			String sDataType = SessionData.getDataTbVal("FIELD_TBL", row, "Data type");
			if (!sTableName.isEmpty()) {
				table = sTableName;
			}
			onDataModelSteps.create_child(table);
			if (!sFieldName.isEmpty()) {
				onDataModelSteps.enter_element_name(sFieldName);
			}
			if (!sEnglishLabel.isEmpty()) {
				onDataModelSteps.enter_english_label(sEnglishLabel);
			}
			if (!sFrenchLabel.isEmpty()) {
				onDataModelSteps.enter_french_label(sFrenchLabel);
			}
			if (!sKindOfElement.isEmpty()) {
				if (sKindOfElement.contains("-")) {
					String elementType = sKindOfElement.substring(sKindOfElement.indexOf("-") + 1);
					sKindOfElement = sKindOfElement.substring(0, sKindOfElement.indexOf("-") - 1);
					onDataModelSteps.select_kind_of_element(sKindOfElement);
					onDataModelSteps.check_chkbox_element_type(elementType.trim());
				} else {
					onDataModelSteps.select_kind_of_element(sKindOfElement);
				}

			}
			if (!sReferencedTable.isEmpty()) {
				onDataModelSteps.enter_referenced_table(sReferencedTable);
			}
			if (!sForeignKeyToCurrentTable.isEmpty()) {
				onDataModelSteps.enter_foreign_key_to_current_table(sForeignKeyToCurrentTable);
			}
			if (!sDataType.isEmpty()) {
				onDataModelSteps.select_data_type(sDataType);
			}
			onDataModelSteps.click_btn_create();
		}
	}

	@And("^user publishes data model$")
	public void user_publishes_data_model() throws Throwable {
		onDataModelSteps.publish_data_model();

	}

	@And("^user creates complex data types as following with the \"([^\"]*)\"$")
	public void user_creates_complex_data_types_as_following_with_the_something(String dataKey,
			List<List<String>> dataTable) throws Throwable {
		SessionData.addDataTable("COMPLEX_TBL", dataTable, false);
		LinkedHashMap<Integer, List<String>> testData = new LinkedHashMap<>();
		testData = SessionData.getDataTbRowsByValEqualInCol("COMPLEX_TBL", "KEY", dataKey);
		for (int row : testData.keySet()) {
			String sTypename = SessionData.getDataTbVal("COMPLEX_TBL", row, "Type name");
			String sLabel = SessionData.getDataTbVal("COMPLEX_TBL", row, "Label and description English");
			onDataModelSteps.create_complex_data_type();
			if (!sTypename.isEmpty()) {
				onDataModelSteps.enter_complex_type_name(sTypename);
			}
			if (!sLabel.isEmpty()) {
				onDataModelSteps.enter_complex_lable(sLabel);
			}
			onDataModelSteps.click_btn_create();
		}
	}

}
