package com.orchestranetworks.auto.addon.dmdv.steps;

import java.util.List;

import org.junit.Assert;

import com.orchestranetworks.auto.addon.dmdv.DMDVConstant;
import com.orchestranetworks.auto.addon.dmdv.LinkModelBean;
import com.orchestranetworks.auto.addon.dmdv.NodeModelBean;
import com.orchestranetworks.auto.addon.dmdv.pages.GraphViewPage;

import net.thucydides.core.annotations.Step;

public class GraphViewSteps {

	GraphViewPage onGraphViewPage;

	@Step
	public void generate_graph() {
		onGraphViewPage.click_btn_generate_graph();
		
	}

	@Step
	public void click_btn_close_graph() {
		onGraphViewPage.click_btn_close_graph();

	}

	@Step
	public void verify_graph_not_displayed() {
		Assert.assertEquals("Verify graph displayed: ", false, onGraphViewPage.is_graph_displayed());

	}

	@Step
	public void verify_graph_displayed() {
		Assert.assertEquals("Verify graph displayed: ", true, onGraphViewPage.is_graph_displayed());

	}

	@Step
	public void export_graph_to_file(String format) {
		onGraphViewPage.click_btn_export_graph();
		onGraphViewPage.select_export_to_file(format);

	}

	@Step
	public void verify_file_exported(String fileName) {
		Assert.assertEquals("Verify downloaded file: ", fileName, onGraphViewPage.get_lastest_file());

	}

	@Step
	public void select_fullscreen_graph() {
		onGraphViewPage.click_btn_fullscreen();

	}

	@Step
	public void verify_graph_display_fullscreen() {
		Assert.assertEquals("Verify graph displays fullscreen: ", true, onGraphViewPage.is_graph_fullscreen());

	}

	@Step
	public void select_exit_fullscreen() {
		onGraphViewPage.click_btn_exit_fullscreen();

	}

	@Step
	public void verify_graph_not_display_fullscreen() {
		Assert.assertEquals("Verify graph displays fullscreen:", false, onGraphViewPage.is_graph_fullscreen());

	}

	@Step
	public void click_btn_zoom_in() {
		onGraphViewPage.click_btn_zoom_in();

	}

	@Step
	public void click_btn_zoom_out() {
		onGraphViewPage.click_btn_zoom_out();

	}

	@Step
	public void open_filter_graph() {
		onGraphViewPage.click_btn_filter_graph();
		Assert.assertEquals("Verify filter screen is opened:", true, onGraphViewPage.is_filter_screen_opened());

	}

	@Step
	public void filter_with_all_fields() {
		onGraphViewPage.check_chkbx_select_all_field();
		onGraphViewPage.click_btn_apply_filter();

	}

	@Step
	public void filter_with_no_fields() {
		onGraphViewPage.uncheck_chkbx_select_all_field();
		onGraphViewPage.click_btn_apply_filter();

	}

	@Step
	public void close_filter_graph() {
		onGraphViewPage.click_btn_filter_graph();
		Assert.assertEquals("Verify filter screen is opened:", false, onGraphViewPage.is_filter_screen_opened());

	}

	public void save_graph(String graphName, String description, String owner, String shareWith) {
		onGraphViewPage.click_btn_save_graph();
		onGraphViewPage.enter_graph_name(graphName);
		onGraphViewPage.enter_description(description);
		onGraphViewPage.choose_owner(owner);
		onGraphViewPage.choose_shareWith(shareWith);
		onGraphViewPage.save_graph_name();
	}

	public void load_new_graph(String graphName) {
		onGraphViewPage.click_btn_load_graph();
		onGraphViewPage.select_graph(graphName);
		onGraphViewPage.click_btn_generate_graph();
	}

	public void click_btn_template_configuration() {
		onGraphViewPage.click_btn_template_configuration();
	}

	public void set_template_configuration(String config, String option, String value) {
		onGraphViewPage.enter_template_configuration(config, option, value);

	}

	public void click_btn_save_configuration() {
		onGraphViewPage.click_btn_save_configuration();

	}

	public void select_configuration_display_options(String value) {
		String[] options = value.split(",");
		for (int i = 0; i < options.length; i++) {
			onGraphViewPage.select_chkbox_display_option(options[i]);
		}

	}

	public void select_record_with_ID(String recordID) {
		onGraphViewPage.select_record_with_ID(recordID);

	}

	public void verify_warning_popup_display(String content) {
		Assert.assertEquals("Verify popup displayed:", content, onGraphViewPage.get_text_popup_message());

		onGraphViewPage.click_btn_close_popup();
	}

	public Long getNumberOfNodes() {
		return onGraphViewPage.getNumberOfNodes();
	}

	public boolean isGraphContainsNodeKey(String nodeKey) {
		return onGraphViewPage.isGraphContainsNodeKey(nodeKey);
	}

	public void printNode(String nodeKey) {
		onGraphViewPage.printNode(nodeKey);

	}
	
	public void select_graph_configuration(String configuration) {
		onGraphViewPage.select_graph_configuration(configuration);

	}

	public void click_btn_generate() {
		onGraphViewPage.click_btn_generate();

	}

	public void verify_config_value_updated(String nodeKey, String config, String option, String value) {
		Assert.assertEquals("Verify configiguration:", "#" + value,
				onGraphViewPage.get_node_info(nodeKey, config, option));

	}

	public void hover() {
		// TODO need implement
	}
	public void verify_graph_template_displayed() {
		Assert.assertEquals("Verify graph template displayed: ", true, onGraphViewPage.is_graph_template_displayed());
		
	}

	public void expandTarget(String nodeKey) {
		onGraphViewPage.expandTarget(nodeKey,0);

	}

	public void expandParent(String nodeKey) {
		onGraphViewPage.expandParent(nodeKey,0);

	}

	public void expandChild(String nodeKey) {
		onGraphViewPage.expandChild(nodeKey,0);

	}

	public void expandSource(String nodeKey) {
		onGraphViewPage.expandSource(nodeKey,0);

	}

	public void collapseSource(String nodeKey) {
		onGraphViewPage.collapseSource(nodeKey,0);

	}

	public void collapseChild(String nodeKey) {
		onGraphViewPage.collapseChild(nodeKey,0);

	}
//MuaBT added
	public void collapseTarget(String nodeKey) {
		onGraphViewPage.collapseTarget(nodeKey,0);
			}
	
	public void collapseParent(String nodeKey) {
		onGraphViewPage.collapseParent(nodeKey,0);
			}
	
	public String get_error_message_page() {
		return onGraphViewPage.get_error_message_page();
	}
	//*******************

	public void expandSourceRecursively(String nodeKey) {
		onGraphViewPage.expandSource(nodeKey, DMDVConstant.DEFAULT_RECURSIVE_LEVEL);
	}

	public void expandTargetRecursively(String nodeKey) {
		onGraphViewPage.expandTarget(nodeKey, DMDVConstant.DEFAULT_RECURSIVE_LEVEL);
	}
	
	public void expandParentRecursively(String nodeKey) {
		onGraphViewPage.expandParent(nodeKey, DMDVConstant.DEFAULT_RECURSIVE_LEVEL);
	}
	
	public void expandChildRecursively(String nodeKey) {
		onGraphViewPage.expandChild(nodeKey, DMDVConstant.DEFAULT_RECURSIVE_LEVEL);
	}

	public void collapseSourceRecursively(String nodeKey) {
		onGraphViewPage.collapseSource(nodeKey, DMDVConstant.DEFAULT_RECURSIVE_LEVEL);
	}

	public void collapseTargetRecursively(String nodeKey) {
		onGraphViewPage.collapseTarget(nodeKey, DMDVConstant.DEFAULT_RECURSIVE_LEVEL);
	}
	
	public void collapseParentRecursively(String nodeKey) {
		onGraphViewPage.collapseParent(nodeKey, DMDVConstant.DEFAULT_RECURSIVE_LEVEL);
	}
	
	public void collapseChildRecursively(String nodeKey) {
		onGraphViewPage.collapseChild(nodeKey, DMDVConstant.DEFAULT_RECURSIVE_LEVEL);
	}

	public boolean must_select_configuration() {
		onGraphViewPage.switchToLastIFrame();
		return onGraphViewPage.isElementExistNow("//span[text()='List graph configuration']");
	}

	public void verify_tables_displayed(List<List<String>> expectedTables) {
		List<NodeModelBean> nodes = onGraphViewPage.getAllTables();
		Assert.assertEquals(expectedTables.size(), nodes.size());
		int totalMatched = 0;
		for (NodeModelBean actualNode : nodes) {
			for (List<String> exptectedTable : expectedTables) {
				String expectedLabel = exptectedTable.get(0);
				String expectedGroup = exptectedTable.get(1);
				if (actualNode.getLabel().equals(expectedLabel) && actualNode.getGroup().equals(expectedGroup)) {
					totalMatched++;
					break;
				}
			}
		}
		Assert.assertEquals(expectedTables.size(), totalMatched);
	}

	public void verify_fields_displayed(List<List<String>> expectedFields) {
		List<NodeModelBean> fields = onGraphViewPage.getAllFields();
		Assert.assertEquals(expectedFields.size(), fields.size());
		int totalMatched = 0;
		for (NodeModelBean actualNode : fields) {
			for (List<String> exptectedTable : expectedFields) {
				String expectedLabel = exptectedTable.get(0);
				String expectedTable = exptectedTable.get(1);
				if (actualNode.getLabel().equals(expectedLabel) && actualNode.getGroup().equals(expectedTable)) {
					totalMatched++;
					break;
				}
			}
		}
		Assert.assertEquals(expectedFields.size(), totalMatched);
	}

	public void verify_links_displayed(List<List<String>> expectedLinks) {
		List<LinkModelBean> actualLinks = onGraphViewPage.getAllLinks();
		Assert.assertEquals(expectedLinks.size(), actualLinks.size());
		int totalMatched = 0;
		for (LinkModelBean actualNode : actualLinks) {
			for (List<String> exptectedLink : expectedLinks) {
				String expectedFrom = exptectedLink.get(0);
				String expectedTo = exptectedLink.get(1);
				String expectedLabel = exptectedLink.get(2);
				if (actualNode.getFrom().equals(expectedFrom) && actualNode.getTo().equals(expectedTo)
						&& actualNode.getLabel().equals(expectedLabel)) {
					Assert.assertEquals(exptectedLink.get(3), actualNode.getFromText());
					Assert.assertEquals(exptectedLink.get(4), actualNode.getToText());
					totalMatched++;
					break;
				}
			}
		}
		Assert.assertEquals(expectedLinks.size(), totalMatched);
	}
}
