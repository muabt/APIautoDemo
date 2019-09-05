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

	/**
	 * Give access to EBX Home page
	 * <p>
	 * <b>Example</b>:
	 * <font color="blue">Given</font> the user is on the EBX home page
	 * </p>
	 * @throws Exception
	 */
	@Given("^the user is on the EBX home page$")
	public void the_user_is_on_the_EBX_home_page() throws Exception {
		onCommonSteps.user_access_to_ebx_home_page();
	}

	/**
	 * Method to login to the ebx
	 * <p>
	 * <b>Example</b>:
	 * <font color="blue">Given</font> I login to EBX succesfully
	 * </p>
	 * @throws Throwable
	 */
	@Given("^I login to EBX succesfully$")
	public void user_login_to_ebx_succesfully() throws Throwable {
		onCommonSteps.user_access_to_ebx_home_page();
		onLoginSteps.login_to_system(LoadConfig.getUserName(), LoadConfig.getPassword());
		onLoginSteps.verify_login_success();
	}

    /**
     * Log out to the ebx
	 * <p>
	 * <b>Example</b>:
	 * <font color="blue">Given</font> I logout successfully
	 * </p>
	 * @throws Exception
     */
	@When("^I logout successfully$")
	public void i_logout_successfully() throws Exception {
		onCommonSteps.click_on_user_panel();
		onCommonSteps.click_btn_logout();
	}

	/**
	 * Give access to a menu of a main page
	 * <p>
	 * <b>Example</b>:
	 * <font color="blue">And</font> I access "<font color="green">dataspace</font>" menu
	 * </p>
	 * @param menu a menu item such as 'administration', 'dataspace', 'workflow'
	 * @throws Throwable
	 */
	@And("^I access \"([^\"]*)\" menu$")
	public void user_accesses_menu(String menu) throws Throwable {
		onCommonSteps.click_on_menu(menu);
	}

	/**
	 * Change the language to desired language
	 * <p>
	 * <b>Example</b>:
	 * <font color="blue">Given</font> user change language to "<font color="green">Portuguese (Brazil)</font>" menu
	 * </p>
	 * @param name language name
	 */
	@Given("^user change language to \"([^\"]*)\"$")
	public void user_change_language(String name) throws Throwable {
		onCommonSteps.click_on_user_panel();
		onCommonSteps.click_on_language();
		onCommonSteps.click_on_choose_language(name);
	}

	/**
	 * Access to a perspective given the user has permission already
	 * <p>
	 * <b>Example</b>:
	 * <font color="blue">Given</font> I permission to access perspective with name "<font color="green">GDPR Art. 17: Right to be forgotten</font>"
	 * </p>
	 * @param perName perspective
	 */
	@Given("^I permission to access perspective with name \"([^\"]*)\"$")
	public void i_permission_to_access_perspective_with_name(String perName) throws Throwable {
		onCommonSteps.select_perspective(perName);
	}

	/**
	 * Access an action in perspective
	 * <p>
	 * <b>Example</b>:
	 * <font color="blue">Given</font> I want to access action "<font color="green">Compliance > Supervisory authorities</font>"
	 * </p>
	 * @param path path to the specific action. Eg: Compliance
	 */
	@And("^I want to access action \"([^\"]*)\"$")
	public void i_want_to_access_action(String path) throws Throwable {
		onCommonSteps.go_to_perspective_action(path);
	}
}
