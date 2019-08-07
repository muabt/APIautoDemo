package com.orchestranetworks.auto.addon.common.steps;

import com.orchestranetworks.auto.addon.common.pages.CommonPage;

import net.thucydides.core.annotations.Step;

public class CommonSteps {

	CommonPage onCommonPage;

	@Step
	public void user_access_to_ebx_home_page() {
		onCommonPage.access_to_homepage();

	}

	@Step
	public void click_on_user_panel() {
		onCommonPage.click_on_user_panel();

	}

	@Step
	public void click_btn_logout() {
		onCommonPage.click_btn_logout();

	}

	@Step
	public void click_on_menu_dataset() {
		onCommonPage.click_menu("Dataset");

	}

	@Step
	public void click_on_menu_data_models() {
		onCommonPage.click_menu("Data models");

	}

	@Step
	public void click_on_menu_dataspaces() {
		onCommonPage.click_menu("Dataspaces");

	}

	@Step
	public void click_on_menu(String menu) {
		onCommonPage.click_menu(menu);

	}

	// MuaBT add
	@Step
	public void click_on_menu_data_workflow() {
		onCommonPage.click_menu("Data workflows");
	}

	@Step
	public void click_on_language() {
		onCommonPage.click_on_language();
	}

	@Step
	public void click_on_choose_language(String languagename) {
		onCommonPage.click_on_choose_language(languagename);
	}

	@Step
	public void select_perspective(String name) {
		onCommonPage.select_perspective(name);
	}

	@Step
	public void go_to_perspective_action(String path) {
		onCommonPage.go_to_perspective_action(path);
	}

	@Step
	public void click_btn_apply() {
		onCommonPage.click_btn_apply();
	}
	
	@Step
	public void confirm_popup() {
		onCommonPage.confirmPopupOK();
	}
	
	@Step
	public void click_btn_submit() {
		onCommonPage.click_btn_submit();
	}

	
}
