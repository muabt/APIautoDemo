package com.orchestranetworks.auto.addon.common.defs;

import java.util.LinkedHashMap;
import java.util.List;

import com.orchestranetworks.auto.addon.SessionData;
import com.orchestranetworks.auto.addon.common.steps.CommonSteps;
import com.orchestranetworks.auto.addon.common.steps.LoginSteps;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;

public class LoginDefs {
	@Steps
	LoginSteps onLoginSteps;
	@Steps
	CommonSteps onCommonSteps;

	/**
	 * Login to EBX using username and password
	 * <p>
	 * <b>Example</b>:
	 * <ul>
	 * <font color="blue">When</font> user login to EBX with username "<font color="green">tracy</font>"
	 * and password "<font color="blue">onvn</font>"
	 * </ul>
	 * </p>
	 *
	 * @param username username
	 * @param password password
	 * @throws Throwable
	 */
	@When("^user login to EBX with username \"([^\"]*)\" and password \"([^\"]*)\"$")
	public void user_login_to_EBX_with_username_is_and_password_is(String username, String password) throws Exception {
		onLoginSteps.login_to_system(username, password);
		onLoginSteps.verify_login_success();
	}

	/**
	 * In a scenario that user has successfully login with username and password
	 *
	 * <p>
	 * <b>Example</b>:
	 * <ul>
	 * <font color="blue">Given</font> I login to EBX with user "<font color="green">tracy</font>"
	 * and password "<font color="green">onvn</font>" successfully
	 * </ul>
	 * </p>
	 *
	 * @param username username
	 * @param password password
	 * @throws Throwable
	 */
	@Given("^I login to EBX with user \"([^\"]*)\" and password \"([^\"]*)\" successfully$")
	public void i_login_to_ebx_with_user_and_password_successfully(String username, String password)
			throws Throwable {
		if (onLoginSteps.is_login_success()) {
			onCommonSteps.click_on_user_panel();
			onCommonSteps.click_btn_logout();
		}
		onLoginSteps.login_to_system(username, password);
		onLoginSteps.verify_login_success();
	}

	/**
	 * Verify the user login successfully
	 *
	 * <p>
	 * <b>Example</b>:
	 * <ul>
	 * <font color="blue">Then</font> user should be logged successfully
	 * </ul>
	 * </p>
	 *
	 * @throws Exception
	 */
	@Then("^user should be logged successfully$")
	public void user_should_be_logged_successfully() throws Exception {
		onLoginSteps.verify_login_success();
	}

	/**
	 * Verify the user login failed
	 *
	 * <p>
	 * <b>Example</b>:
	 * <ul>
	 * <font color="blue">Then</font> user should be logged failed
	 * </ul>
	 * </p>
	 *
	 * @throws Exception
	 */
	@Then("^user should be logged fail$")
	public void user_should_be_logged_failed() throws Exception {
		onLoginSteps.verify_login_failure();
	}

	/**
	 * Verify the login status in multiple login case
	 * <p>
	 * This case usually go after {@link #user_login_to_ebx_with_username_is_and_password_is(String, String)}
	 *</p>
	 * <p>
	 * <b>Example</b>:
	 * <ul>
	 * <font color="blue">When</font> user login to EBX with username is <<font color="orange">user</font>>
	 * and password is <<font color="orange">pass</font>>
	 * </ul>
	 *
	 * <ul>
	 *     <font color="blue">Examples</font>
	 *     <ul>
	 *			     | <font color="orange">user</font> &nbsp;&nbsp;| <font color="orange">pass</font> | <font color="orange">status</font> |
	 *     </ul>
	 *     <ul>
	 *			     | <font color="green">user1</font> | <font color="green">pass</font> | <font color="green">passed</font> |
	 *     </ul>
	 *     <ul>
	 *			     | <font color="green">user2</font> | <font color="green">pass</font> | <font color="green">failed</font> |
	 *     </ul>
	 * </ul>
	 *
	 * </p>
	 *
	 * @param status
	 * @throws Throwable
	 */
	@Then("^user verify the (.+) in step$")
	public void user_verify_the_in_step(String status) throws Throwable {
		if (status.toLowerCase().equals("success")) {
			onLoginSteps.verify_login_success();
		} else
			onLoginSteps.verify_login_failure();
	}

	/**
	 * Multiple login given the list of user password
	 * <p>
	 * The list of user password will save into a list, with unique key for each entries<br>
	 * Use before {@link #user_verify_the_status_as_following_with_the(String, List)}}
	 * </p>
	 *
	 * <p>
	 * <b>Example</b>:
	 * <ul>
	 * <font color="blue">When</font> user login to EBX with username and password as following with the <<font color="orange">KEY</font>>
	 * </ul>
	 *
	 *     <ul>
	 *			     | <font color="green">KEY</font> | <font color="green">user</font> &nbsp;&nbsp;| <font color="green">pass</font> |
	 *     </ul>
	 *     <ul>
	 *			     | <font color="green">01</font>&nbsp;&nbsp; | <font color="green">user1</font> | <font color="green">pass</font> |
	 *     </ul>
	 *     <ul>
	 *			     |  <font color="green">02</font>&nbsp;&nbsp; | <font color="green">user2</font> | <font color="green">pass</font> |
	 *     </ul>
	 *
	 * </p>
	 * @param dataKey key to store user/password list in Serenity session
	 * @param dataTable contain user/password list
	 * @throws Exception
	 */
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

	/**
	 * Verify the status of login for given users
	 *
	 * <p>
	 * <b>Example</b>:
	 * <ul>
	 * <font color="blue">Then</font> user verify the status as following with the <<font color="orange">KEY</font>>
	 * </ul>
	 *
	 *     <ul>
	 *			     | <font color="green">KEY</font> | <font color="green">Status</font> &nbsp;&nbsp;| <font color="green">User Error Message</font> |  <font color="green">Password Error Message</font> |
	 *     </ul>
	 *     <ul>
	 *			     | <font color="green">01</font>&nbsp;&nbsp;&nbsp; | <font color="green">Success</font> | | |
	 *     </ul>
	 *     <ul>
	 *			     |  <font color="green">02</font>&nbsp;&nbsp;&nbsp; | <font color="green">Failed</font>&nbsp;&nbsp; | <font color="green">Unknown user or invalid password.</font> | |
	 *     </ul>
	 *
	 * <ul>
	 *     <font color="blue">Examples</font>
	 *     <ul>
	 *			     | <font color="orange">KEY</font>|
	 *     </ul>
	 *     <ul>
	 *			     | <font color="green">01</font> |
	 *     </ul>
	 *     <ul>
	 *			     | <font color="green">02</font> |
	 *     </ul>
	 * </ul>
	 * </p>
	 * @param dataKey key to store the data in Serenity session
	 * @param dataTable contain login information
	 * @throws Exception
	 */
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

	/**
	 * Login to EBX using many input username, password
	 *
	 * <p>
	 * <b>Example</b>:
	 * <ul>
	 * <font color="blue">When</font> user login to EBX with username is <<font color="orange">user</font>>
	 * and password is <<font color="orange">pass</font>>
	 * </ul>
	 *
	 * <ul>
	 *     <font color="blue">Examples</font>
	 *     <ul>
	 *			     | <font color="orange">user</font> &nbsp;&nbsp;| <font color="orange">pass</font> |
	 *     </ul>
	 *     <ul>
	 *			     | <font color="green">user1</font> | <font color="green">pass</font> |
	 *     </ul>
	 *     <ul>
	 *			     | <font color="green">user2</font> | <font color="green">pass</font> |
	 *     </ul>
	 * </ul>
	 *
	 * </p>
	 *
	 * @param user username
	 * @param pass password
	 * @throws Throwable
	 */
	@When("^user login to EBX with username is (.+) and password is (.+)$")
	public void user_login_to_ebx_with_username_is_and_password_is(String user, String pass) throws Throwable {
		onLoginSteps.login_to_system(user, pass);
	}

}
