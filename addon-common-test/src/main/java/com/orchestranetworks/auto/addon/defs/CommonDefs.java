package com.orchestranetworks.auto.addon.defs;

import com.orchestranetworks.auto.addon.utils.Constants;
import com.orchestranetworks.auto.addon.utils.LoadConfig;
import com.orchestranetworks.auto.addon.steps.CommonSteps;
import cucumber.api.DataTable;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;

import java.util.List;
import java.util.Map;

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
    @Given("^I login to EBX successfully$")
    public void i_login_to_ebx_successfully() {
        onCommonSteps.access_login_page();
        onCommonSteps.login_to_system(LoadConfig.getUserName(), LoadConfig.getPassword());
        onCommonSteps.verify_login_success();

    }

    /**
     * Login to EBX using username and password
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">When</font> user login to EBX with username
     * "<font color="green">tracy</font>" and password
     * "<font color="blue">onvn</font>"
     * </ul>
     * </p>
     *
     * @param username username
     * @param password password
     */
    @When("^I login to EBX with username \"([^\"]*)\" and password \"([^\"]*)\"$")
    public void i_login_to_EBX_with_username_is_and_password_is(String username, String password) {
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
    public void i_access_menu(String menu) {
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
     * <b>Example</b>: <font color="blue">Given</font> I want to access action
     * "<font color="green">Compliance > Supervisory authorities</font>"
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
     * <b>Example</b>: <font color="blue">When</font> I access dataspace
     * "<font color="green">Master Data - Reference>DMDV_v1.3.0</font>"
     * </p>
     *
     * @param path path to the data space. Eg: FastTrack>[03] Parties
     *             data>Company employees
     */
    @When("^I access dataspace \"([^\"]*)\"$")
    public void i_access_dataspace(String path) {
        onCommonSteps.go_to_dataspace(path);
    }

    /**
     * Access to the specified data set <b>Example</b>:
     * <font color="blue">When</font> I access dataset
     * "<font color="green">V130_US25</font>"
     * </p>
     *
     * @param path name of the data set
     * @throws Exception
     */
    @When("^I access dataset \"([^\"]*)\"$")
    public void I_access_data_set(String path) {
        onCommonSteps.go_to_dataset(path);
    }

    /**
     * Access to a table of a dataset
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">And</font> I access table
     * "<font color="green">Employee</font>"
     * </ul>
     * </p>
     *
     * @param tblName table name that user want to access
     */
    @And("^I access table \"([^\"]*)\"$")
    public void I_access_table(String tblName) {
        onCommonSteps.click_on_table_name(tblName);
    }

    /**
     * Give an access to administration service of EBX
     * <p>
     * <b>Example</b>: Access to dataspaces administration service:
     * <ul>
     * <font color="blue">And</font> I access to administration feature
     * "<font color="green">Repository management>Dataspaces</font>"
     * </ul>
     * </p>
     *
     * @param path Path to service, such as "Directory, User Interface"
     */
    @And("^I access administration feature \"([^\"]*)\"$")
    public void i_access_administration_feature(String path) throws Throwable {
        onCommonSteps.go_to_administration_item(path);
    }

    /**
     * Access to a table of a dataset in dataspace
     * <p>
     * <b>Example</b>:
     * <ul>
     * <font color="blue">And</font> I access table "Employee" of dataset "Human_Resource" in dataspace "Master Data - Reference>Reference-child"
     * "<font color="green">Employee</font>"
     * </ul>
     * </p>
     *
     * @param tableName     table name that user want to access
     * @param datasetPath   path to access dataset
     * @param dataspacePath path to dataspace
     */

    @And("^I access table \"([^\"]*)\" of dataset \"([^\"]*)\" in dataspace \"([^\"]*)\"$")
    public void i_access_table_of_dataset_in_dataspace(String tableName, String datasetPath,
                                                       String dataspacePath) {
        onCommonSteps.access_menu(Constants.MENU_DATASET);
        onCommonSteps.go_to_dataspace(dataspacePath);
        onCommonSteps.go_to_dataset(datasetPath);
        onCommonSteps.click_on_table_name(tableName);
    }

    @When("^I access table \"([^\"]*)\" of dataset \"([^\"]*)\"$")
    public void i_access_table_of_dataset(String tableName, String datasetPath) {
        onCommonSteps.go_to_dataset(datasetPath);
        onCommonSteps.click_on_table_name(tableName);

    }

    @When("^I select filter by simple search with criterion$")
    public void i_select_filter_by_simple_search_with_criterion(DataTable dt) {
        onCommonSteps.click_btn_filter();
        List<Map<String, String>> list = dt.asMaps(String.class, String.class);
        for (Map<String, String> row : list) {
            String criterion = row.get("Criterion");
            String oper = row.get("Operation");
            String value = row.get("Value");
            String type = row.get("Field type");

            onCommonSteps.select_criteria_with_label(criterion);

            if (!oper.isEmpty()) {
                onCommonSteps.select_operator_of_field(oper, criterion);
            }

            if (!value.isEmpty()) {
                String[] itemList = value.split(",");
                for (int j = 0; j < itemList.length; j++) {
                    onCommonSteps.input_search_value(itemList[j].trim(), type, criterion);
                }
            }
        }
        onCommonSteps.click_btn_apply_advanced_search();
    }

    @When("^I select filter by advanced search with criterion and logical \"([^\"]*)\"$")
    public void i_select_filter_by_advanced_search_with_criterion_and_logical(DataTable dt, String logical) {
        onCommonSteps.click_btn_filter();
        onCommonSteps.select_advanced_mode();
        onCommonSteps.select_logical_search(logical);
        List<Map<String, String>> list = dt.asMaps(String.class, String.class);
        for (Map<String, String> row : list) {
            String criterion = row.get("Criterion");
            String oper = row.get("Operation");
            String value = row.get("Value");
            String type = row.get("Field type");

            onCommonSteps.select_criteria_with_label(criterion);

            if (!oper.isEmpty()) {
                onCommonSteps.select_operator_of_field(oper, criterion);
            }

            if (!value.isEmpty()) {
                String[] itemList = value.split(",");
                for (int j = 0; j < itemList.length; j++) {
                    onCommonSteps.input_search_value(itemList[j].trim(), type, criterion);
                }
            }
        }
        onCommonSteps.click_btn_apply_advanced_search();
    }

    @When("^I select filter by text with keyword and field below$")
    public void i_select_filter_by_text_with_keyword_and_field_below(DataTable dt) {
        onCommonSteps.click_btn_filter();
        onCommonSteps.click_btn_expand_with_label(Constants.TEXT_SEARCH);
        onCommonSteps.unselect_field_with_label("Select all");
        List<Map<String, String>> list = dt.asMaps(String.class, String.class);
		Map<String, String> row = list.get(0);

		String fieldContains = row.get("Field contains:");
		String inField = row.get("In fields");

		if (!fieldContains.isEmpty()) {
            onCommonSteps.input_text_keyword(fieldContains);
		}

		if (!inField.isEmpty()) {
			String[] item = inField.split(",");
			for (int i = 0; i < item.length; i++) {
                onCommonSteps.select_search_item(Constants.TEXT_SEARCH, item[i].trim());
			}
		} else {
            onCommonSteps.select_search_item(Constants.TEXT_SEARCH, "Select all");

		}
        onCommonSteps.click_btn_apply_text_search();
    }

    @When("^I select filter by validation with keyword and field below$")
    public void i_select_filter_by_validation_with_keyword_and_field_below(DataTable dt) {
        onCommonSteps.click_btn_filter();
        onCommonSteps.click_btn_expand_with_label(Constants.VALIDATION_SEARCH);
        onCommonSteps.unselect_field_with_label("Errors");

        List<Map<String, String>> list = dt.asMaps(String.class, String.class);
        Map<String, String> row = list.get(0);

        String msgContains = row.get("Message contains:");
        String severity = row.get("Severity");

        if (!msgContains.isEmpty()) {
            onCommonSteps.input_validation_keyword(msgContains);

        }

        if (!severity.isEmpty()) {
            String[] itemList = severity.split(",");
            for (int i = 0; i < itemList.length; i++) {
                onCommonSteps.select_search_item(Constants.VALIDATION_SEARCH, itemList[i].trim());
            }
        }
        onCommonSteps.click_btn_apply_validation_search();
    }

    @When("^I select filter by fuzzy search with keyword and field below$")
    public void i_select_filter_by_fuzzy_search_with_keyword_and_field_below(DataTable dt) {
        onCommonSteps.click_btn_filter();
        onCommonSteps.click_btn_expand_with_label(Constants.FUZZY_SEARCH);
        onCommonSteps.unselect_field_with_label("Select all");

        List<Map<String, String>> list = dt.asMaps(String.class, String.class);
        Map<String, String> row = list.get(0);

        String recordContains = row.get("Record contains:");
        String fields = row.get("Fields");

        if (!fields.isEmpty()) {
            String[] item = fields.split(",");
            for (int i = 0; i < item.length; i++) {
                onCommonSteps.select_search_item(Constants.FUZZY_SEARCH, item[i].trim());
            }
        }

        if (!recordContains.isEmpty()) {
            onCommonSteps.input_fuzzy_keyword(recordContains);
        }
        onCommonSteps.click_btn_apply_fuzzy_search();
    }
}
