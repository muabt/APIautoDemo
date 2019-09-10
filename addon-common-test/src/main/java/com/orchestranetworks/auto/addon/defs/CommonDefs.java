package com.orchestranetworks.auto.addon.defs;

import com.orchestranetworks.auto.addon.LoadConfig;
import com.orchestranetworks.auto.addon.steps.CommonSteps;

import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;

public class CommonDefs {

    @Steps
    CommonSteps onCommonSteps;

    /**
     * Method to login to the ebx
     * <p>
     * <b>Example</b>: <font color="blue">Given</font> I login to EBX
     * succesfully
     * </p>
     */
    @Given("^I login to EBX succesfully$")
    public void user_login_to_ebx_succesfully() {
        onCommonSteps.access_login_page();
        onCommonSteps.login_to_system(LoadConfig.getUserName(), LoadConfig.getPassword());
        onCommonSteps.verify_login_success();
    }

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
     */
    @When("^user login to EBX with username \"([^\"]*)\" and password \"([^\"]*)\"$")
    public void user_login_to_EBX_with_username_is_and_password_is(String username, String password) {
        if (onCommonSteps.is_login_success()) {
            onCommonSteps.open_user_panel();
            onCommonSteps.click_btn_logout();
        }
        onCommonSteps.login_to_system(username, password);
        onCommonSteps.verify_login_success();
    }

    /**
     * Log out to the ebx
     * <p>
     * <b>Example</b>: <font color="blue">Given</font> I logout successfully
     * </p>
     */
    @When("^I logout successfully$")
    public void i_logout_successfully() {
        onCommonSteps.open_user_panel();
        onCommonSteps.click_btn_logout();
    }

    /**
     * Give access to a menu of a main page
     * <p>
     * <b>Example</b>: <font color="blue">And</font> I access
     * "<font color="green">dataspace</font>" menu
     * </p>
     *
     * @param menu a menu item such as 'administration', 'dataspace', 'workflow'
     */
    @And("^I access \"([^\"]*)\" menu$")
    public void user_accesses_menu(String menu) {
        onCommonSteps.access_menu(menu);
    }

    /**
     * Change the language to desired language
     * <p>
     * <b>Example</b>: <font color="blue">Given</font> user change language to
     * "<font color="green">Portuguese (Brazil)</font>" menu
     * </p>
     *
     * @param name language name
     */
    @Given("^user change language to \"([^\"]*)\"$")
    public void user_change_language(String name) {
        onCommonSteps.open_user_panel();
        onCommonSteps.change_language(name);
    }

    @Given("^I change perspective with name \"([^\"]*)\"$")
    public void i_change_perspective_with_name(String perName) {
        onCommonSteps.change_perspective(perName);
    }

    /**
     * Access an action in perspective
     * <p>
     * <b>Example</b>:
     * <font color="blue">Given</font> I want to access action "<font color="green">Compliance > Supervisory authorities</font>"
     * </p>
     *
     * @param path path to the specific action. Eg: Compliance
     */
    @And("^I navigate to perspective action \"([^\"]*)\"$")
    public void i_want_to_access_action(String path) {
        onCommonSteps.navigate_to_perspective_action(path);
    }

    /**
     * Access to the specified data space
     * <p>
     * <b>Example</b>:
     * <font color="blue">When</font> I access dataspace "<font color="green">Master Data - Reference>DMDV_v1.3.0</font>"
     * </p>
     *
     * @param path path to the data space. Eg: FastTrack>[03] Parties data>Company employees
     */
    @When("^I access dataspace \"([^\"]*)\"$")
    public void user_accesses_dataspace(String path) {
        onCommonSteps.go_to_dataspace(path);
    }

    /**
     * Access to the specified data set
     * <b>Example</b>:
     * <font color="blue">When</font> I access dataset "<font color="green">V130_US25</font>"
     * </p>
     *
     * @param path name of the data set
     * @throws Exception
     */
    @When("^I access dataset \"([^\"]*)\"$")
    public void I_access_data_set(String path) {
        onCommonSteps.go_to_data_set(path);
    }

    /**
     * Access to a table of a dataset
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">And</font> I access table "<font color="green">Employee</font>"
     * </ul>
     * </p>
     *
     * @param tblName table name that user want to access
     */
    @And("^I access table \"([^\"]*)\"$")
    public void I_access_table(String tblName) {
        onCommonSteps.click_on_table_name(tblName);
    }

    @And("^I access dataspace \"([^\"]*)\" then access dataset \"([^\"]*)\" then access table \"([^\"]*)\"$")
    public void iAccessDataspaceThenAccessDatasetThenAccessTable(String dataspacePath, String datasetPath, String tableName) {
        onCommonSteps.go_to_dataspace(dataspacePath);
        onCommonSteps.go_to_data_set(datasetPath);
        onCommonSteps.click_on_table_name(tableName);
    }
}
