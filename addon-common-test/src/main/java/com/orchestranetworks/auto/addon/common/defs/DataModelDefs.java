package com.orchestranetworks.auto.addon.common.defs;

import java.util.LinkedHashMap;
import java.util.List;

import com.orchestranetworks.auto.addon.SessionData;
import com.orchestranetworks.auto.addon.common.steps.CommonSteps;
import com.orchestranetworks.auto.addon.common.steps.DataModelSteps;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;

@Deprecated
public class DataModelDefs {
	@Steps
	DataModelSteps onDataModelSteps;
	@Steps
	CommonSteps onCommonSteps;

	/**
	 * Access to a specific data model
	 * <p>
	 * <b>Example</b>:
	 * <font color="blue">Given</font> I access data model "<font color="green">DMP-01</font>"
	 * </p>
	 * @param path name of the data model
	 * @throws Exception
	 */
	@Given("^I access data model \"([^\"]*)\"$")
	public void user_accesses_data_model(String path) throws Exception {
		onCommonSteps.click_on_menu_data_models();
		onDataModelSteps.select_data_model(path);
	}

	/**
	 * Create a data model with specific name
	 * <p>
	 * <b>Example</b>:
	 * <font color="blue">When</font> user want to create new Data Model has the name "<font color="green">StoreDataModel</font>"
	 * </p>
	 * @param dataModelName name of data model that user want to create
	 */
	@When("^user want to create new Data Model has the name \"([^\"]*)\"$")
	public void user_want_to_create_new_data_model_has_the_name(String dataModelName) {
		onDataModelSteps.click_on_menu_data_models();
		onDataModelSteps.create_new_data_model(dataModelName);
	}

	/**
	 * Select data model given the name
	 * <p>
	 * <b>Example</b>:
	 * <font color="blue">When</font> user want to select Data Model has the name "<font color="green">StoreDataModel</font>"
	 * </p>
	 * @param dataModelName data model name
	 */
	@When("^user want to select Data Model has the name \"([^\"]*)\"$")
	public void user_want_to_select_data_model_has_the_name(String dataModelName) {
		onDataModelSteps.click_on_menu_data_models();
		onDataModelSteps.select_data_model(dataModelName);
	}

	/**
	 * Create multiple tables on the data model given the information
	 *<p>
	 * The read data from the table will be stored in the Serenity Session by
	 * using {@link net.serenitybdd.core.Serenity#setSessionVariable(Object)}
	 * </p>
	 *
	 * <p>
	 * <b>Example</b>:
	 * <font color="blue">And</font> user creates tables with information as following with the <<font color="orange">KEY</font>>
	 *     <ul>
	 *			     <font color="green">| KEY | Name      | Label and description English | French      | Kind of element |</font>
	 *     </ul>
	 *     <ul>
	 *			     <font color="green">|  01 | Store     | Stores                        | Stores      | Table           |</font>
	 *     </ul>
	 *     <ul>
	 *			     <font color="green">|  01 | Category  | Categories                    | Categories  | Table           |</font>
	 *     </ul>
	 * </ul>
	 * </p>
	 * @param dataKey the key to save data table to Serenity session
	 * @param dataTable contain information of the tables
	 * @throws Throwable
	 */
	@And("^user creates tables with information as following with the \"([^\"]*)\"$")
	public void user_creates_tables_with_information_as_following(String dataKey,
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

	/**
	 * Create multiple elements on the table given the information
	 *
	 * <p>
	 * The read data from the table will be stored in the Serenity Session by
	 * using {@link net.serenitybdd.core.Serenity#setSessionVariable(Object)}
	 * </p>
	 *
	 * <p>
	 * <b>Example</b>:
	 * <font color="blue">And</font> user creates element as following with the <<font color="orange">KEY</font>>
	 *     <ul>
	 *			     <font color="green">| KEY | Table name | Field name | Label and description English | French   | Kind of element | Data type |</font>
	 *     </ul>
	 *     <ul>
	 *			     <font color="green">|  01 | Address    | street     | Street                        | Street   | Field           | String    |</font>
	 *     </ul>
	 *     <ul>
	 *			     <font color="green">|  01 | Address    | city       | City                          | City     | Field           | String    |</font>
	 *     </ul>
	 * </ul>
	 * </p>
	 * @param dataKey the key to save data to Serenity session
	 * @param dataTable contain information of the elements
	 * @throws Throwable
	 */
	@And("^user creates element as following with the \"([^\"]*)\"$")
	public void user_creates_element_for_table_as_following(String dataKey,
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

	/**
	 * Click button to publish data model
	 *
	 * <p>
	 * <b>Example</b>:
	 * <font color="blue">And</font> user publishes data model
	 * </p>
	 * @throws Throwable
	 */
	@And("^user publishes data model$")
	public void user_publishes_data_model() throws Throwable {
		onDataModelSteps.publish_data_model();

	}

	/**
	 * Create complex data types using the specific data
	 *
	 * <p>
	 * <b>Example</b>:
	 * <font color="blue">And</font> user creates complex data types as following with the <<font color="orange">KEY</font>>
	 *     <ul>
	 *			     <font color="green">| KEY | Type name | Label and description English |</font>
	 *     </ul>
	 *     <ul>
	 *			     <font color="green">|  01 | Address   | Address                       |</font>
	 *     </ul>
	 * </ul>
	 * </p>
	 * @param dataKey key to store the data table
	 * @param dataTable data table
	 * @throws Throwable
	 */
	@And("^user creates complex data types as following with the \"([^\"]*)\"$")
	public void user_creates_complex_data_types_as_following(String dataKey,
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
