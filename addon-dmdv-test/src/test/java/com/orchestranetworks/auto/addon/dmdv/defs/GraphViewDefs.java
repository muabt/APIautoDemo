package com.orchestranetworks.auto.addon.dmdv.defs;

import java.util.LinkedHashMap;
import java.util.List;

import org.junit.Assert;

import com.orchestranetworks.auto.addon.SessionData;
import com.orchestranetworks.auto.addon.common.steps.DataModelSteps;
import com.orchestranetworks.auto.addon.common.steps.DatasetSteps;
import com.orchestranetworks.auto.addon.dmdv.steps.GraphViewSteps;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;

public class GraphViewDefs {
	@Steps
	GraphViewSteps onGraphViewSteps;
	@Steps
	DatasetSteps onDatasetSteps;
	@Steps
	DataModelSteps onDataModelSteps;

	@When("^user views data model graph$")
	public void user_views_data_model_graph() throws Exception {
		onDatasetSteps.click_btn_action_dataset();
		onDatasetSteps.select_dataset_service("Visualization>Display data model");
		onGraphViewSteps.generate_graph();
	}

	@When("^user views data model graph via DMA$")
	public void user_views_data_model_graph_via_DMA() throws Exception {
		onDataModelSteps.click_btn_action_data_model();
		onDataModelSteps.select_data_model_service("Visualization>Display data model");
		onGraphViewSteps.generate_graph();
	}

	@When("^user views data model API graph by service$")
	public void user_views_data_model_API_graph_by_service() throws Exception {
		onDatasetSteps.click_btn_action_dataset();
		onDatasetSteps.select_dataset_service("Add-on Tests>dmdvTestGraphModelAPIWithoutConfiguration");
		// onGraphViewSteps.generate_graph();
	}

	@Then("^graph should has (\\d+) groups and nodes$")
	public void graph_should_has_number_of_nodes(Long number) throws Exception {
		Long tableCount = onGraphViewSteps.getNumberOfNodes();
		Assert.assertEquals(number.intValue(), tableCount != null ? tableCount.intValue() : 0);
	}

	@Then("^graph should has node key: \"(.*)\"$")
	public void graph_should_has_node_key(String nodeKey) throws Exception {

		Assert.assertTrue(onGraphViewSteps.isGraphContainsNodeKey(nodeKey));
		onGraphViewSteps.printNode(nodeKey);
	}

	@When("^user expands group fields on table \"([^\"]*)\"$")
	public void user_expands_group_fields_on_table_something(String nodeKey) throws Throwable {
		onGraphViewSteps.expandChild(nodeKey);
		onGraphViewSteps.expandSource(nodeKey);
		onGraphViewSteps.collapseSource(nodeKey);
		onGraphViewSteps.collapseChild(nodeKey);
	}

	@And("^user generates graph with configuration \"([^\"]*)\"$")
	public void user_generates_graph_with_configuration_something(String configuration) throws Throwable {
		if (onGraphViewSteps.must_select_configuration()) {
			onGraphViewSteps.select_graph_configuration(configuration);
			onGraphViewSteps.click_btn_generate();
		}
	}

	@Then("^the graph \"([^\"]*)\" should be updated according to configuration$")
	public void the_graph_should_be_updated_according_to_configuration(String nodeKey, List<List<String>> dataTable)
			throws Exception {
		SessionData.addDataTable("VERIFY_TBL_1", dataTable, false);
		LinkedHashMap<Integer, List<String>> testData = new LinkedHashMap<>();
		testData = SessionData.getDataTbRows("VERIFY_TBL_1");
		String config = "";
		String option = "";
		String value = "";
		onGraphViewSteps.printNode(nodeKey);
		for (int i = 1; i < testData.size(); i++) {
			List<String> row = testData.get(i);
			config = row.get(0);
			option = row.get(1);
			value = row.get(2);
			onGraphViewSteps.verify_config_value_updated(nodeKey, config, option, value);
		}
	}

	@When("^user closes graph$")
	public void user_closes_graph() throws Exception {
		onGraphViewSteps.click_btn_close_graph();
	}

	@Then("^the graph should be displayed$")
	public void the_graph_should_be_displayed() throws Throwable {
		onGraphViewSteps.verify_graph_displayed();
	}

	@Then("^the graph is no longer displayed\\.$")
	public void the_graph_is_no_longer_displayed() throws Exception {
		onGraphViewSteps.verify_graph_not_displayed();
	}

	@And("^user exports graph to \"([^\"]*)\" file$")
	public void user_exports_graph_to_something_file(String format) throws Throwable {
		onGraphViewSteps.export_graph_to_file(format);
	}

	@Then("^\"([^\"]*)\" file should exported$")
	public void something_file_should_exported(String fileName) throws Throwable {
		onGraphViewSteps.verify_file_exported(fileName);
	}

	@When("^user selects fullscreen graph$")
	public void user_selects_fullscreen_graph() throws Exception {
		onGraphViewSteps.select_fullscreen_graph();
	}

	@Then("^graph should be displayed fullscreen$")
	public void graph_should_be_displayed_fullscreen() throws Exception {
		onGraphViewSteps.verify_graph_display_fullscreen();
	}

	@When("^user exits fullscreen$")
	public void user_exits_fullscreen() throws Exception {
		onGraphViewSteps.select_exit_fullscreen();
	}

	@Then("^graph should be displayed normally$")
	public void graph_should_be_displayed_normally() throws Exception {
		onGraphViewSteps.verify_graph_not_display_fullscreen();
	}

	@When("^user zoom in graph$")
	public void user_zoom_in_graph() throws Exception {
		onGraphViewSteps.click_btn_zoom_in();
	}

	@Then("^graph should be zoomed-in$")
	public void graph_should_be_zoomed_in() throws Exception {
	}

	@When("^user zoom out graph$")
	public void user_zoom_out_graph() throws Exception {
		onGraphViewSteps.click_btn_zoom_out();
	}

	@Then("^graph should be zoomed-out$")
	public void graph_should_be_zoomed_out() throws Exception {
	}

	@When("^user wants to filter graph$")
	public void user_wants_to_filter_graph() throws Throwable {
		onGraphViewSteps.open_filter_graph();
	}

	@And("^user move cursor on some fields on tables list$")
	public void user_move_cursor_on_some_fields_on_tables_list() throws Throwable {
		onGraphViewSteps.hover();
	}

	@And("^user applies filter with all field$")
	public void user_applies_filter_with_all_field() throws Throwable {
		onGraphViewSteps.filter_with_all_fields();
	}

	@And("^user applies filter with no field$")
	public void user_applies_filter_with_no_field() throws Throwable {
		onGraphViewSteps.filter_with_no_fields();
	}

	@And("^user finished filter graph$")
	public void user_finished_filter_graph() throws Throwable {
		onGraphViewSteps.close_filter_graph();
	}

	@Then("^user should see the warning \"([^\"]*)\"$")
	public void user_should_see_the_warning_something(String content) throws Throwable {
		onGraphViewSteps.verify_warning_popup_display(content);
	}

	@When("^user saves graph as the name \"([^\"]*)\" and description \"([^\"]*)\" and Owner \"([^\"]*)\" and sharWith \"([^\"]*)\"$")
	public void user_saves_graph_as_the_name_something_and_description_something_and_owner_something_and_sharwith_something(
			String graphName, String description, String owner, String shareWith) throws Throwable {
		onGraphViewSteps.save_graph(graphName, description, owner, shareWith);
	}

	@When("^user loads new graph has the name \"([^\"]*)\"$")
	public void user_loads_new_graph_has_the_name_something(String graphName) throws Throwable {
		onGraphViewSteps.load_new_graph(graphName);
	}

	@When("^user wants to change graph template$")
	public void user_wants_to_change_graph_template() throws Throwable {
		onGraphViewSteps.click_btn_template_configuration();

	}

	@When("^verify display graph template$")
	public void verify_display_graph_template() throws Throwable {
		onGraphViewSteps.click_btn_template_configuration();
		onGraphViewSteps.verify_graph_template_displayed();
	}

	@When("^user updates configuration as following$")
	public void user_updates_configuration_as_following(List<List<String>> dataTable) throws Exception {
		SessionData.addDataTable("VERIFY_TBL", dataTable, false);
		LinkedHashMap<Integer, List<String>> testData = new LinkedHashMap<>();
		testData = SessionData.getDataTbRows("VERIFY_TBL");
		String config = "";
		String option = "";
		String value = "";
		for (int i = 1; i < testData.size(); i++) {
			List<String> row = testData.get(i);
			config = row.get(0);
			option = row.get(1);
			value = row.get(2);
			if (config.equals("Display options")) {
				onGraphViewSteps.select_configuration_display_options(value);
			} else
				onGraphViewSteps.set_template_configuration(config, option, value);
		}
		onGraphViewSteps.click_btn_save_configuration();
	}

	@And("^user views \"([^\"]*)\" of record has ID is \"([^\"]*)\"$")
	public void user_views_something_of_record_has_id_is_something(String service, String recordID) throws Throwable {
		onDatasetSteps.select_record_with_PK(recordID);
		onDatasetSteps.select_table_service(service);
	}

	@And("^user views \"([^\"]*)\" of records have ID are$")
	public void user_views_something_of_records_have_id_are_something(String service, List<List<String>> ids)
			throws Throwable {
		for (List<String> list : ids) {
			String[] pks = new String[list.size()];
			list.toArray(pks);
			onDatasetSteps.select_record_with_PK(pks);
		}
		onDatasetSteps.select_table_service(service);
	}

	@And("^user add permission with element \"([^\"]*)\"$")
	public void user_add_permission_with_element_something(String name) throws Throwable {
		onDatasetSteps.click_btn_action_dataset();
		onDatasetSteps.click_on_permission();
		// TODO need refactor method name
		onDatasetSteps.click_on_createnewrecord();
		onDatasetSteps.choose_profile();
		onDatasetSteps.choose_policy();
		onDatasetSteps.click_btn_save_and_close();

	}

	// MuaBT added
	@Then("^the error message should be displayed \"([^\"]*)\"$")
	public void the_error_message_should_be_displayed_something(String msg) throws Throwable {
		String actualmsg = onGraphViewSteps.get_error_message_page();
		actualmsg = actualmsg.replace("\"", "");
		Assert.assertEquals(msg, actualmsg);
	}
	// **********************

	@Then("^the graph model should contains following tables and groups")
	public void the_graph_model_should_contains_following_tables_and_groups(List<List<String>> tables)
			throws Throwable {
		onGraphViewSteps.verify_tables_displayed(tables);
	}

	@Then("^the graph model should contains following fields")
	public void the_graph_model_should_contains_following_fields(List<List<String>> fields) throws Throwable {
		onGraphViewSteps.verify_fields_displayed(fields);
	}

	@Then("^the graph model should contains following links")
	public void the_graph_model_should_contains_following_links(List<List<String>> links) throws Throwable {
		onGraphViewSteps.verify_links_displayed(links);
	}
}
