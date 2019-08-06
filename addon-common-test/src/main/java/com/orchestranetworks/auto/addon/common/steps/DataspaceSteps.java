package com.orchestranetworks.auto.addon.common.steps;

import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.common.pages.DataspacePage;

import net.thucydides.core.annotations.Step;

public class DataspaceSteps {
	DataspacePage onDataspacePage;

	@Step
	public void enter_identifier(String identifier) {
		onDataspacePage.enter_identifier(identifier);

	}

	@Step
	public void select_owner(String owner) {
		onDataspacePage.select_owner(owner);

	}

	@Step
	public void enter_english_label(String engLabel) {
		onDataspacePage.enter_english_label(engLabel);

	}

	@Step
	public void click_dataspace_actions() {
		onDataspacePage.click_dataspace_actions(Constants.BTN_ACTIONS);

	}

	@Step
	public void select_dataspace_service(String servicePath) {
		onDataspacePage.select_dataspace_service(servicePath);
	}
	
	@Step 
	public void close_dataspace(String servicePath) {
		onDataspacePage.close_dataspace(servicePath);
	}

	@Step
	public void click_btn_create() {
		onDataspacePage.clickBtn(Constants.BTN_CREATE);

	}

	@Step
	public void click_btn_create_dataspace() {
		onDataspacePage.click_btn_create_dataspace();

	}

}
