package com.orchestranetworks.auto.addon.common.defs;

import java.util.LinkedHashMap;
import java.util.List;

import com.orchestranetworks.auto.addon.SessionData;
import com.orchestranetworks.auto.addon.common.steps.LoginSteps;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;

public class LoginDefs {
	@Steps
	LoginSteps onLoginSteps;

	@When("^user login to EBX with username \"([^\"]*)\" and password \"([^\"]*)\"$")
	public void user_login_to_EBX_with_username_is_and_password_is(String username, String password) throws Exception {
		onLoginSteps.login_to_system(username, password);
	}

	@Then("^user should be logged successfully$")
	public void user_should_be_logged_successfully() throws Exception {
		onLoginSteps.verify_login_success();
	}

	@Then("^user should be logged fail$")
	public void user_should_be_logged_failed() throws Exception {
		onLoginSteps.verify_login_failure();
	}

	@Then("^user verify the (.+) in step$")
	public void user_verify_the_in_step(String status) throws Throwable {
		if (status.toLowerCase().equals("success")) {
			onLoginSteps.verify_login_success();
		} else
			onLoginSteps.verify_login_failure();
	}

	@When("^user login to EBX with username and password as following with the \"([^\"]*)\"$")
	public void user_login_to_EBX_with_username_and_password_as_following_with_the(String dataKey,
			List<List<String>> dataTable) throws Exception {
		SessionData.addDataTable("LOGIN_TBL", dataTable, false);
		LinkedHashMap<Integer, List<String>> testData = new LinkedHashMap<>();
		testData = SessionData.getDataTbRowsByValEqualInCol("LOGIN_TBL", "KEY", dataKey);
		for (int row : testData.keySet()) {
			String sKey = SessionData.getDataTbVal("LOGIN_TBL", row, "KEY");
			String sUserName = SessionData.getDataTbVal("LOGIN_TBL", row, "Username");
			String sPassWord = SessionData.getDataTbVal("LOGIN_TBL", row, "Password");
			if (!sUserName.isEmpty()) {
				onLoginSteps.enter_username(sUserName);
			}
			if (!sPassWord.isEmpty()) {
				onLoginSteps.enter_password(sPassWord);
			}
			onLoginSteps.click_btn_login();
		}
	}

	@Then("^user verify the status as following with the \"([^\"]*)\"$")
	public void user_verify_the_status_as_following_with_the(String dataKey, List<List<String>> dataTable)
			throws Exception {
		SessionData.addDataTable("STATUS_TBL", dataTable, false);
		LinkedHashMap<Integer, List<String>> testData = new LinkedHashMap<>();
		testData = SessionData.getDataTbRowsByValEqualInCol("STATUS_TBL", "KEY", dataKey);
		for (int row : testData.keySet()) {
			String sKey = SessionData.getDataTbVal("STATUS_TBL", row, "KEY");
			String sStatus = SessionData.getDataTbVal("STATUS_TBL", row, "Status");
			String sUserError = SessionData.getDataTbVal("STATUS_TBL", row, "User Error Message");
			String sPasswordError = SessionData.getDataTbVal("STATUS_TBL", row, "Password Error Message");
			if (!sStatus.isEmpty()) {
				if (sStatus.toLowerCase().equals("success")) {
					onLoginSteps.verify_login_success();
				} else
					onLoginSteps.verify_login_failure();
			}
			if (!sUserError.isEmpty()) {
				onLoginSteps.verify_user_error_message(sUserError);
			}
			if (!sPasswordError.isEmpty()) {
				onLoginSteps.verify_pass_error_message(sPasswordError);
			}
		}
	}

	@When("^user login to EBX with username is (.+) and password is (.+)$")
	public void user_login_to_ebx_with_username_is_and_password_is(String user, String pass) throws Throwable {
		onLoginSteps.login_to_system(user, pass);
	}

}
