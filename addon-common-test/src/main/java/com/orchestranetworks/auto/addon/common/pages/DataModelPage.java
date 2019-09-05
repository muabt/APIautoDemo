package com.orchestranetworks.auto.addon.common.pages;

import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.XFormat;
import com.orchestranetworks.auto.addon.common.WebPageObject;

public class DataModelPage extends WebPageObject {

	private static final String BTN_NODE_SERVICES = "Services";
	private static final String XPATH_NODE = "//td[descendant-or-self::text()='%s']";
	private static final String LBL_FOREIGN_KEY_TO_CURRENT_TABLE = "Foreign key to current table";
	private static final String XPATH_SERVICE = "//div[@id='EBX_ContextualMenu']//a[.='%s']";
	private static final String XPATH_DML_NAME = "//input[@id='__domain__sessionContext__dataSetCreationContext__reference']";
	private static final String BTN_SEMANTIC_MODEL = "Semantic model";
	private static final String BTN_PUBLISH = "Publish";
	private static final String LBL_LABEL_AND_DESCRIPTION = "Label and description";
	private static final String LBL_NAME = "Name";

	public DataModelPage(WebDriver driver) {
		super(driver);
	}

	private static final String XPATH_SELECTOR_PANEL = "//div[@id='ebx_SelectorPanel']";
	private static final String XPATH_MENU_DATA_MODELS = "//a[@title='Data models']";
	private static final String XPATH_DATA_MODEL_LIST = "//div[@id='ebx_SelectorPanelTree']";
	private static final String XPATH_SELECT_DATA_MODEL = "//div[@id='ebx_SelectorPanelTree']";
	private static final String XPATH_BTN_CREATE_DML = "//button[@id='ebx_ModelingCreateButton']";
	private static final String XPATH_DATA_MODEL = XPATH_DATA_MODEL_LIST + "//tr/td[2]//a[text()='%s']";
	public static final String NAVIGATION_ITEM = "//a//descendant-or-self::*[text()='%s']";

	public void click_on_menu_data_models() {
		clickOnElement(XPATH_MENU_DATA_MODELS);
	}

	public void click_btn_select_data_model() {
		if (!isElementExistNow(XPATH_DATA_MODEL_LIST)) {
			clickOnElement(XPATH_SELECT_DATA_MODEL);
		}
	}

	public void click_btn_create_data_model() {
		switchToLastIFrame();
		clickOnElement(XPATH_BTN_CREATE_DML);
	}

	public boolean exist_data_model(String dataModelName) {
		expandAllItem();
		switchToLastIFrame();
		return isElementExistNow(XFormat.of(XPATH_DATA_MODEL, dataModelName));
	}

	public void select_data_model(String dataModelName) {
		clickOnElement(XFormat.of(XPATH_DATA_MODEL, dataModelName));

	}

	public void click_btn_actions_data_model() {
		clickBtn("//div[@class='ebx_Toolbar']", Constants.BTN_ACTIONS, 2);

	}

	public void click_btn_create() {
		clickBtn(Constants.BTN_CREATE);

	}

	public void click_btn_select_node_service(String nodeName) {
		clickBtn(XFormat.of(XPATH_NODE, nodeName), BTN_NODE_SERVICES);

	}

	public void select_service(String sevice) {
		clickOnElement(XFormat.of(XPATH_SERVICE, sevice));

	}

	public void enter_element_name(String name) {
		waitTypeAndTabWithLabel(LBL_NAME, name);

	}

	public void enter_english_label(String label) {
		waitTypeAndTabWithLabel(LBL_LABEL_AND_DESCRIPTION, 1, label);

	}

	public void click_btn_publish_data_model() {
		clickBtn("//div[@id='ebx_NavigationSubHeaderToolbar']", BTN_PUBLISH);

	}

	public void click_btn_publish() {
		clickBtn(BTN_PUBLISH);

	}

	public void enter_foreign_key_to_current_table(String sForeignKeyToCurrentTable) {
		waitTypeAndTabWithLabel("//div[@id='associationRow']", LBL_FOREIGN_KEY_TO_CURRENT_TABLE, 1,
				sForeignKeyToCurrentTable);

	}

	public void click_btn_semantic_model() {
		clickBtn(BTN_SEMANTIC_MODEL);
	}

	public void enter_unique_name(String dmlName) {
		waitTypeAndTab(XPATH_DML_NAME, dmlName);
	}

	public void click_btn_action_model() {
		clickBtn(Constants.BTN_ACTIONS, 2);
	}

	public void select_data_model_service(String service) {
		String[] services = service.split(">");
		for (int i = 0; i < services.length; i++) {
			clickOnElement(XFormat.of(NAVIGATION_ITEM, services[i]));
		}
	}

}
