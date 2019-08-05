package com.orchestranetworks.auto.addon.common.steps;

import org.junit.Assert;

import com.orchestranetworks.auto.addon.common.pages.LoginPage;

import net.thucydides.core.annotations.Step;

public class LoginSteps {

	LoginPage onLoginPage;

	@Step
	public void login_to_system(String username, String password) {
		onLoginPage.enter_username(username);
		onLoginPage.enter_password(password);
		onLoginPage.click_btn_login();

	}

	@Step
	public void enter_username(String username) {
		onLoginPage.enter_username(username);
	}

	@Step
	public void enter_password(String password) {
		onLoginPage.enter_password(password);
	}

	@Step
	public void click_btn_login() {
		onLoginPage.click_btn_login();
	}

	@Step
	public void verify_login_success() {
		Assert.assertEquals(true, onLoginPage.is_login_success());
		onLoginPage.remove_choose_dataset_div();

	}

	@Step
	public void verify_login_failure() {
		Assert.assertEquals(false, onLoginPage.is_login_success());

	}

	@Step
	public void verify_user_error_message(String sUserError) {
		Assert.assertEquals(sUserError, onLoginPage.get_login_error_message());

	}

	@Step
	public void verify_pass_error_message(String sPasswordError) {
		Assert.assertEquals(sPasswordError, onLoginPage.get_pass_error_message());

	}

}
