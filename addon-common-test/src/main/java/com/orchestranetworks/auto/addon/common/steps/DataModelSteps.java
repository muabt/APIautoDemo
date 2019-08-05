package com.orchestranetworks.auto.addon.common.steps;

import com.orchestranetworks.auto.addon.common.pages.DataModelPage;

import net.thucydides.core.annotations.Step;

public class DataModelSteps {
	DataModelPage onDataModelPage;

	@Step
	public void click_on_menu_data_models() {
		onDataModelPage.click_on_menu_data_models();

	}

	@Step
	public void create_new_data_model(String dataModelName) {
		if (onDataModelPage.exist_data_model(dataModelName) == true) {
			onDataModelPage.select_data_model(dataModelName);
			onDataModelPage.click_btn_actions_data_model();
			onDataModelPage.select_data_model_service("Delete");
			onDataModelPage.confirmPopupOK();
		}
		onDataModelPage.click_btn_create_data_model();
		onDataModelPage.click_btn_semantic_model();
		onDataModelPage.enter_unique_name(dataModelName);
		onDataModelPage.click_btn_create();
	}

	@Step
	public void click_btn_action_data_model() {
		onDataModelPage.click_btn_action_model();

	}

	@Step
	public void select_data_model_service(String service) {
		onDataModelPage.select_data_model_service(service);
	}

	@Step
	public void select_data_model(String dataModelName) {
		if (onDataModelPage.exist_data_model(dataModelName) == true) {
			onDataModelPage.select_data_model(dataModelName);
		}
	}

	@Step
	public void create_table() {
		onDataModelPage.click_btn_select_node_service("root");
		onDataModelPage.select_service("Create child...");

	}

	@Step
	public void enter_element_name(String name) {
		onDataModelPage.enter_element_name(name);

	}

	@Step
	public void enter_english_label(String label) {
		onDataModelPage.enter_english_label(label);

	}

	@Step
	public void enter_french_label(String label) {

	}

	@Step
	public void select_kind_of_element(String kindOfElement) {
		onDataModelPage.selectRadioBoxWithLabel(kindOfElement);
		if (kindOfElement.equals("Group")) {
			onDataModelPage.checkCheckbox("Reuse an existing type");
		}

	}

	@Step
	public void click_btn_create() {
		onDataModelPage.click_btn_create();
	}

	@Step
	public void check_chkbox_element_type(String elementType) {
		String[] listType = elementType.split("-");
		for (int i = 0; i < listType.length; i++) {
			switch (listType[i].trim()) {
			case "PK":
				onDataModelPage.checkCheckbox("Primary key");
				break;
			case "FK":
				onDataModelPage.checkCheckbox("Foreign key");
				break;
			case "ME":
				onDataModelPage.checkCheckbox("Mandatory element");
				break;
			default:
				break;
			}
		}
	}

	@Step
	public void create_child(String sTableName) {
		onDataModelPage.click_btn_select_node_service(sTableName);
		onDataModelPage.select_service("Create child...");

	}

	@Step
	public void select_data_type(String sDataType) {
		onDataModelPage.selectDDLInput("Data type", sDataType);
	}

	@Step
	public void publish_data_model() {
		onDataModelPage.click_btn_publish_data_model();
		onDataModelPage.click_btn_publish();

	}

	@Step
	public void create_complex_data_type() {
		onDataModelPage.click_btn_select_node_service("Complex data types");
		onDataModelPage.select_service("Create a complex type");

	}

	@Step
	public void enter_complex_type_name(String sTypename) {
		onDataModelPage.waitTypeAndTabWithLabel("Type name", sTypename);

	}

	@Step
	public void enter_complex_lable(String label) {
		onDataModelPage.waitTypeAndTabWithLabel("Label and description", label);

	}

	@Step
	public void enter_referenced_table(String sReferencedTable) {
		onDataModelPage.waitTypeAndTabWithLabel("Referenced table", sReferencedTable);

	}

	@Step
	public void enter_foreign_key_to_current_table(String sForeignKeyToCurrentTable) {
		onDataModelPage.enter_foreign_key_to_current_table(sForeignKeyToCurrentTable);

	}

}
