package com.orchestranetworks.auto.addon.dmdv.pages;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import com.orchestranetworks.auto.addon.DMDVScriptConstants;
import com.orchestranetworks.auto.addon.FileUtils;
import com.orchestranetworks.auto.addon.LogWork;
import com.orchestranetworks.auto.addon.Node;
import com.orchestranetworks.auto.addon.WebPageObject;
import com.orchestranetworks.auto.addon.dmdv.ConverterUtils;
import com.orchestranetworks.auto.addon.dmdv.LinkModelBean;
import com.orchestranetworks.auto.addon.dmdv.NodeModelBean;

public class GraphViewPage extends WebPageObject {

	public GraphViewPage(WebDriver driver) {
		super(driver);
	}

	private static String DOWNLOAD_FOLDER = System.getProperty("user.dir") + "/FileDownloads";
	private static final String XPATH_CREATE_DATASET = "//button[@id='ebx_InstanceCreateButton']";
	private static final String XPATH_DATASET_LIST = "//div[@id='ebx_SelectorPanelTree']";
	private static final String XPATH_GRAPH = "//div[@id='graphContainer']/canvas";

	public Long getNumberOfNodes() {
		JavascriptExecutor jsExec = (JavascriptExecutor) this.driver;
		return (Long) jsExec.executeScript(DMDVScriptConstants.GET_NUMBER_OF_NODES);
	}

	public Boolean isGraphContainsNodeKey(String nodeKey) {
		JavascriptExecutor jsExec = (JavascriptExecutor) this.driver;
		String script = String.format(DMDVScriptConstants.CHECK_NODE_KEY_EXISTED, new Object[] { nodeKey });
		return (Boolean) jsExec.executeScript(script);
	}

	public void printNode(String nodeKey) {
		Node employee = parseResponseToNode(nodeKey);
		System.out.println("is background=" + employee.getBackGround());
	}

	private Node parseResponseToNode(String nodeKey) {
		String script = String.format(DMDVScriptConstants.GET_NODE_DATA_BY_KEY, new Object[] { nodeKey });
		String key = executeJS(script + ".key");
		String label = executeJS(script + ".label");
		String backGround = executeJS(script + ".background");
		String borderColor = executeJS(script + ".borderColor");
		String category = executeJS(script + ".category");
		String group = executeJS(script + ".group");
		String groupType = executeJS(script + ".groupType");
		String hoverColor = executeJS(script + ".hoverColor");
		boolean isGroup = executeJS(script + ".isGroup");
		boolean isVisible = executeJS(script + ".visible");
		boolean isExpanded = executeJS(script + ".isExpanded");
		boolean isExternal = executeJS(script + ".isExternal");
		String nodeType = executeJS(script + ".nodeType");
		String textColor = executeJS(script + ".textColor");
		return new Node(key, label, backGround, borderColor, category, group, groupType, hoverColor, isGroup, isVisible,
				isExpanded, isExternal, nodeType, textColor);
	}

	private String getNodeKeyFromName(String modeName) {
		String script = String.format(DMDVScriptConstants.GET_NODE_DATA_BY_NAME, new Object[] { modeName });
		String key = executeJS(script + ".key");
		return key;
	}

	public void waitGraphCompleted() {
		boolean inProgress = true;
		while (inProgress) {
			String script = DMDVScriptConstants.CHECK_GRAPH_INPROGRESS;
			inProgress = (Boolean) executeJS(script);
			waitAbit(5000);
			System.err.println("Waiting expand/collapse");
		}
	}

	public void expandSource(String nodeKey, int recursive) {
		String script = String.format(DMDVScriptConstants.EXPAND_SOURCE_OF_NODE, new Object[] { nodeKey, recursive });
		executeJS(script);
		waitGraphCompleted();
		System.out.println("Done expandSource");
	}

	public void collapseSource(String nodeKey, int recursive) {
		String script = String.format(DMDVScriptConstants.COLLAPSE_SOURCE_OF_NODE, new Object[] { nodeKey, recursive });
		executeJS(script);
		waitGraphCompleted();
		System.out.println("Done collapseSource");
	}

	public void expandTarget(String nodeKey, int recursive) {
		String script = String.format(DMDVScriptConstants.EXPAND_TARGET_OF_NODE, new Object[] { nodeKey, recursive });
		executeJS(script);
		waitGraphCompleted();
		System.out.println("Done expandTarget");
	}

	public void collapseTarget(String nodeKey, int recursive) {
		String script = String.format(DMDVScriptConstants.COLLAPSE_TARGET_OF_NODE, new Object[] { nodeKey, recursive });
		executeJS(script);
		waitGraphCompleted();
		System.out.println("Done collapseTarget");
	}

	public void expandParent(String nodeKey, int recursive) {
		String script = String.format(DMDVScriptConstants.EXPAND_PARENT_OF_NODE, new Object[] { nodeKey, recursive });
		executeJS(script);
		waitGraphCompleted();
		System.out.println("Done expandParent");
	}

	public void collapseParent(String nodeKey, int recursive) {
		String script = String.format(DMDVScriptConstants.COLLAPSE_PARENT_OF_NODE, new Object[] { nodeKey, recursive });
		executeJS(script);
		waitGraphCompleted();
		System.out.println("Done collapseParent");
	}

	public void expandChild(String nodeKey, int recursive) {
		String script = String.format(DMDVScriptConstants.EXPAND_CHILD_OF_NODE, new Object[] { nodeKey, recursive });
		executeJS(script);
		waitGraphCompleted();
		System.out.println("Done expandChild");
	}

	public void collapseChild(String nodeKey, int recursive) {
		String script = String.format(DMDVScriptConstants.COLLAPSE_CHILD_OF_NODE, new Object[] { nodeKey, recursive });
		executeJS(script);
		waitGraphCompleted();
		System.out.println("Done collapseChild");
	}

	public void select_graph_configuration(String configuration) {
		switchToLastIFrame();
		selectRadioBoxWithLabel(configuration);
	}

	public void click_btn_generate() {
		clickBtn("Generate");

	}

	public String get_node_info(String nodeKey, String config, String option) {
		Node employee = parseResponseToNode(nodeKey);
		String configValue = "";
		switch (option.toLowerCase()) {
		case "background":
			configValue = employee.getBackGround();
			break;
		case "border":
			configValue = employee.getBorderColor();
			break;
		case "text":
			configValue = employee.getTextColor();
			break;
		default:
			break;
		}
		return configValue;
	}

	public void click_btn_generate_graph() {
		switchToLastIFrame();
		boolean isPresent = driver
				.findElements(By.xpath("//div[@class='ebx_ActionsBack']/button[normalize-space()='Generate']"))
				.size() > 0;
		if (isPresent) {
			clickBtn("Generate");
			waitForDMDVGraphDisplayed();
		}
	}

	public void click_btn_close_graph() {
		clickBtn("Close");
	}

	public boolean is_graph_displayed() {
		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		boolean elementExistNow = isElementExistNow(XPATH_GRAPH);
		if (!elementExistNow) {
			switchToLastIFrame();
			return isElementExistNow(XPATH_GRAPH);
		}
		return elementExistNow;
	}

	private void waitForDMDVGraphDisplayed() {
		waitForPresenceOfElement(XPATH_GRAPH);
	}

	public void click_btn_export_graph() {
		try {
			deleteDownloadFolder();
		} catch (IOException e) {
			e.printStackTrace();
		}
		clickBtn("Export");

	}

	private void deleteDownloadFolder() throws IOException {
		File files = new File(DOWNLOAD_FOLDER);
		FileUtils.deleteFiles(files);

	}

	public void click_btn_fullscreen() {
		clickBtn("Fullscreen");

	}

	public void click_btn_exit_fullscreen() {
		clickBtn("Fullscreen");
	}

	public void select_export_to_file(String format) {
		clickOnElement("//span[contains(normalize-space(text()),'" + format.toUpperCase() + "')]");
		waitAbit(2000);
	}

	public String get_lastest_file() {
		File file = FileUtils.getLatestFilefromDir(DOWNLOAD_FOLDER);
		String csvFileName = file.getName();
		LogWork.info("File Downloaded is :[" + csvFileName + "]");
		return csvFileName;
	}

	public boolean is_graph_fullscreen() {
		String xPath = "//button[contains(@class,'fullscreen-off-btn') and @title='Fullscreen']";
		return isElementExistNow(xPath);
	}

	public void click_btn_zoom_in() {
		clickBtn("Zoom in");

	}

	public void click_btn_zoom_out() {
		clickBtn("Zoom out");

	}

	public void click_btn_filter_graph() {
		clickBtn("Filters");
	}

	public boolean is_filter_screen_opened() {
		String xPathFilterScreen = "//div[@class='ebx_FilterPane filter-box' and contains(@style,'display: block;')]";
		return isElementExistNow(xPathFilterScreen);
	}

	public void click_btn_apply_filter() {
		clickBtn("Apply");

	}

	public void click_btn_save_graph() {
		switchToLastIFrame();
		clickBtn("Save");

	}

	/*
	 * public void enter_graph_name(String graphName) { switchToLastIFrame();
	 * waitTypeAndTabWithLabel("Graph name", graphName);
	 * 
	 * }
	 */
	/*
	 * public void save_graph_name() { clickBtn("Save", 2); switchToLastIFrame();
	 * confirmPopupYES(); switchToFirstIFrame(); confirmPopupOK(); }
	 */

	// MuaBT add
	public void enter_graph_name(String graphName) {
		if (StringUtils.isEmpty(graphName)) {
			return;
		}
		waitTypeAndTab("//*[@id=\"graphName\"]", graphName);
	}

	public void enter_description(String description) {
		if (StringUtils.isEmpty(description)) {
			return;
		}
		waitTypeAndTab("//*[@id=\"graphServiceBody\"]//div[2]/textarea", description);
	}

	public void choose_owner(String owner) {
		if (StringUtils.isEmpty(owner)) {
			return;
		}
		clickOnElement("//button[@title='datalist']");
		clickOnElement("//span[normalize-space()='" + owner + "']");
	}

	public void choose_shareWith(String shareWith) {
		if (StringUtils.isEmpty(shareWith)) {
			return;
		}
		clickOnElement("//select/option[normalize-space()='" + shareWith + "']");
	}

	public void save_graph_name() {
		clickOnElement("(//*[@id=\"ebx_WorkspaceFormFooter\"]/div[1]/button)[1]");
		String notification = "///*[@class='hd']/h2[text()='Notification']";
		if (isElementExistNow(notification)) {
			clickOnElement("//div[@id='ebx_DialogBox']//button[text()='Yes']");
		}
	}
	//

	public void click_btn_load_graph() {
		switchToLastIFrame();
		clickBtn("Load");

	}

	public void select_graph(String graphName) {
		switchToLastIFrame();
		selectRadioBoxWithLabel(graphName);

	}

	public void click_btn_template_configuration() {
		clickBtn("Template");
//		switchToLastIFrame();
//		clickOnElement("//*[@id=\"workspaceToolBar\"]/button[@title='Template']");
	}

	public void enter_template_configuration(String config, String option, String value) {
		String xPathHighlightColor = "(//tr[td[@class='ebx_Label'][label[.='" + config
				+ "']]]//div[@class='ebx_FieldDecorator']//div[1]//input)[1]";
		String xPathConfig = "(//tr[td[@class='ebx_Label'][label[.='" + config
				+ "']]]//div[@class='ebx_FieldDecorator']//label[.='" + option
				+ "']/following-sibling::div[1]//input)[1] ";
		if (config.equals("Highlight color")) {
			waitTypeAndTab(xPathHighlightColor, "#" + value);
		} else
			waitTypeAndTab(xPathConfig, "#" + value);

	}

	public void click_btn_save_configuration() {
		clickBtn("Save");
		// clickOnElement("//*[@class='ebx_FlatButton ebx_Button ebx_DefaultButton']");

	}

	public void select_chkbox_display_option(String string) {
		// TODO Auto-generated method stub

	}

	public void select_record_with_ID(String recordID) {
		// TODO Auto-generated method stub

	}

	public void click_btn_close_popup() {
		// TODO Auto-generated method stub

	}

	public void check_chkbx_select_all_field() {
		// TODO Auto-generated method stub

	}

	public void uncheck_chkbx_select_all_field() {
		clickOnElement("//label/input[@class ='ebx_checkboxCustom']");

	}

	public String get_text_popup_message() {
		switchToIFrame("ebx-legacy-component");
		WebElement element = driver
				.findElement(By.xpath("//li/div[@class= 'ebx_MessageBoxMessage ebx_MessageBoxMessageUnread']"));
		return element.getText();
	}

	public Object is_graph_template_displayed() {
		switchToLastIFrame();
		if (isElementExistNow("//div[h3[.='Template configuration']]")) {
			return isElementExistNow("//div[h3[.='Template configuration']]");
		}
		return isElementExistNow("//div/div[span[.='Template configuration']]");
	}
	// MuaBT added

	public String get_error_message_page() {
		boolean isPresent = driver.findElements(By.xpath("//div[@class='_ebx-error-block_content']")).size() > 0;
		if (isPresent) {
			WebElement element = driver.findElement(By.xpath("//div[@class='_ebx-error-block_content']"));
			System.out.println(element.getText());
			return element.getText();
		}
		return null;
	}
	// *************************

	public List<NodeModelBean> getAllTables() {
		String script = String.format(DMDVScriptConstants.GET_GO_DIAGRAM);
		ArrayList<String> jsonResult = executeJS(script);
		List<NodeModelBean> rs = new ArrayList<>();
		Map<String, NodeModelBean> groupMap = new HashMap<>();
		for (String nodeString : jsonResult) {
			NodeModelBean node = ConverterUtils.parse(nodeString, NodeModelBean.class);
			if (node.getLabel() == null) {
				continue;
			}
			if (node.getGroupType().equals("GROUP")) {
				if (node.getNodeType().equals("GROUP")) {
					groupMap.put(node.getKey(), node);
				}
				rs.add(node);
			}
		}
		for (NodeModelBean nodeModelBean : rs) {
			NodeModelBean groupBean = groupMap.get(nodeModelBean.getGroup());
			String group = groupBean == null ? "" : groupBean.getLabel();
			nodeModelBean.setGroup(group);
			System.out.println("| " + nodeModelBean.getLabel() + " |" + group + " |");
		}

		return rs;
	}

	public List<NodeModelBean> getAllFields() {
		String script = String.format(DMDVScriptConstants.GET_GO_DIAGRAM);
		ArrayList<String> jsonResult = executeJS(script);
		List<NodeModelBean> rs = new ArrayList<>();
		Map<String, NodeModelBean> tableMap = new HashMap<>();
		for (String nodeString : jsonResult) {
			NodeModelBean node = ConverterUtils.parse(nodeString, NodeModelBean.class);
			if (node.getGroupType().equals("GROUP") && node.getNodeType().equals("TABLE")) {
				tableMap.put(node.getKey(), node);
			}
			if (node.getGroupType().equals("FIELD")) {
				rs.add(node);
			}
		}
		for (NodeModelBean nodeModelBean : rs) {
			NodeModelBean groupBean = tableMap.get(nodeModelBean.getGroup());
			String group = groupBean == null ? "" : groupBean.getLabel();
			group = group == null ? "" : group;
			nodeModelBean.setGroup(group);
			System.out.println("| " + nodeModelBean.getLabel() + " |" + group + " |");
		}

		return rs;
	}

	public List<LinkModelBean> getAllLinks() {
		Map<String, NodeModelBean> tableMap = new HashMap<>();
		for (NodeModelBean nodeModelBean : getAllTables()) {
			if (nodeModelBean.getNodeType().equals("TABLE")) {
				tableMap.put(nodeModelBean.getKey(), nodeModelBean);
			}
		}

		String script = String.format(DMDVScriptConstants.GET_ALL_LINKS);
		ArrayList<String> jsonResult = executeJS(script);
		List<LinkModelBean> rs = new ArrayList<>();
		for (String nodeString : jsonResult) {
			LinkModelBean link = ConverterUtils.parse(nodeString, LinkModelBean.class);
			NodeModelBean fromNode = tableMap.get(link.getFrom());
			NodeModelBean toNode = tableMap.get(link.getTo());
			if (fromNode != null && toNode != null) {
				link.setFrom(fromNode.getLabel());
				link.setTo(toNode.getLabel());
				System.out.println("|" + fromNode.getLabel() + " |" + toNode.getLabel() + " |" + link.getLabel() + " |"
						+ link.getFromText() + " |" + link.getToText() + " |");
				rs.add(link);
			}
		}
		return rs;
	}
}
