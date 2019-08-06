package com.orchestranetworks.auto.addon.common.defs;

import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.LoadConfig;
import com.orchestranetworks.auto.addon.common.steps.CommonSteps;
import com.orchestranetworks.auto.addon.common.steps.DatasetSteps;
import com.orchestranetworks.auto.addon.common.steps.LoginSteps;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.ClearCookiesPolicy;
import net.thucydides.core.annotations.Managed;
import net.thucydides.core.annotations.Steps;

public class CommonDefs {
	@Managed(clearCookies = ClearCookiesPolicy.BeforeEachTest)
	WebDriver driver;

	@Steps
	CommonSteps onCommonSteps;
	@Steps
	LoginSteps onLoginSteps;
	@Steps
	DatasetSteps onDatasetSteps;

	@Given("^the user is on the EBX home page$")
	public void the_user_is_on_the_EBX_home_page() throws Exception {
		onCommonSteps.user_access_to_ebx_home_page();
	}

	@Given("^I login to EBX succesfully$")
	public void user_login_to_ebx_succesfully() throws Throwable {
		onCommonSteps.user_access_to_ebx_home_page();
		onLoginSteps.login_to_system(LoadConfig.getUserName(), LoadConfig.getPassword());
		onLoginSteps.verify_login_success();
	}

	@When("^user logout succesfully$")
	public void user_logout_succesfully() throws Exception {
		onCommonSteps.click_on_user_panel();
		onCommonSteps.click_btn_logout();
	}

	@And("^I access \"([^\"]*)\" menu$")
	public void user_accesses_something_menu(String menu) throws Throwable {
		onCommonSteps.click_on_menu(menu);
	}

	@And("^I access to administration service \"([^\"]*)\"$")
	public void i_access_to_administration_service_something(String service) throws Throwable {
		onCommonSteps.go_to_admin_service(service);
	}


    @And("^I delete the dataspace \"([^\"]*)\" with service \"([^\"]*)\"$")
    public void i_delete_the_dataspace_something_with_service_something(String dataspaceName, String servicePath) throws Throwable {
		onDatasetSteps.select_record_with_PK(dataspaceName);
		onDatasetSteps.select_table_service(servicePath);
		onCommonSteps.click_btn_submit();
		onCommonSteps.confirm_popup();
	}

	// MuaBT add
	@Given("^user change language to \"([^\"]*)\"$")
	public void user_change_language_to_something(String languagename) throws Throwable {
		onCommonSteps.click_on_user_panel();
		onCommonSteps.click_on_language();
		onCommonSteps.click_on_choose_language(languagename);
	}

	@Given("^I permission to access perspective with name \"([^\"]*)\"$")
	public void i_permission_to_access_perspective_with_name_something(String perName) throws Throwable {
		onCommonSteps.select_perspective(perName);
	}

	@And("^I want to access action \"([^\"]*)\"$")
	public void i_want_to_access_action_something(String path) throws Throwable {
		onCommonSteps.go_to_perspective_action(path);
	}
}
