package com.orchestranetworks.auto.addon.dmdv.pages;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.DMDVScriptConstants;
import com.orchestranetworks.auto.addon.FileUtils;
import com.orchestranetworks.auto.addon.LogWork;
import com.orchestranetworks.auto.addon.WebPageObject;
import com.orchestranetworks.auto.addon.dmdv.ConverterUtils;
import com.orchestranetworks.auto.addon.dmdv.LinkDataDisplayBean;
import com.orchestranetworks.auto.addon.dmdv.NodeDataDisplayBean;

public class GraphDataPage extends WebPageObject {

	public GraphDataPage(WebDriver driver) {
		super(driver);
	}

	private static String DOWNLOAD_FOLDER = System.getProperty("user.dir") + "/FileDownloads";
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

	public String getNodeLabel(String nodeKey) {
		String script = String.format(DMDVScriptConstants.GET_NODE_DATA_BY_KEY, new Object[] { nodeKey });
		String jsonResult = executeJS(script);
		NodeDataDisplayBean node = ConverterUtils.parse(jsonResult, NodeDataDisplayBean.class);
		return node.getText();
	}

//MuaBT add
	public String getLinkLabel(String linkKey) {
		String script = String.format(DMDVScriptConstants.GET_LINK_DATA_BY_KEY, new Object[] { linkKey });
		String jsonResult = executeJS(script);
		LinkDataDisplayBean link = ConverterUtils.parse(jsonResult, LinkDataDisplayBean.class);
		return link.getText();
	}

	public String getNodeKeyFromName(String modeName) {
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

	public void expandSource(String nodeKey) {
		String script = String.format(DMDVScriptConstants.EXPAND_SOURCE_OF_NODE, new Object[] { nodeKey, 0 });
		executeJS(script);
		waitGraphCompleted();
		System.out.println("Done expandSource");
	}

	public void collapseSource(String nodeKey) {
		String script = String.format(DMDVScriptConstants.COLLAPSE_SOURCE_OF_NODE, new Object[] { nodeKey, 0 });
		executeJS(script);
		waitGraphCompleted();
		System.out.println("Done collapseSource");
	}

	public void expandTarget(String nodeKey) {
		String script = String.format(DMDVScriptConstants.EXPAND_TARGET_OF_NODE, new Object[] { nodeKey, 0 });
		executeJS(script);
		waitGraphCompleted();
		System.out.println("Done expandTarget");
	}

	public void collapseTarget(String nodeKey) {
		String script = String.format(DMDVScriptConstants.COLLAPSE_TARGET_OF_NODE, new Object[] { nodeKey, 0 });
		executeJS(script);
		waitGraphCompleted();
		System.out.println("Done collapseTarget");
	}

	public void expandParent(String nodeKey) {
		String script = String.format(DMDVScriptConstants.EXPAND_PARENT_OF_NODE, new Object[] { nodeKey, 0 });
		executeJS(script);
		waitGraphCompleted();
		System.out.println("Done expandParent");
	}

	public void collapseParent(String nodeKey) {
		String script = String.format(DMDVScriptConstants.COLLAPSE_PARENT_OF_NODE, new Object[] { nodeKey, 0 });
		executeJS(script);
		waitGraphCompleted();
		System.out.println("Done collapseParent");
	}

	public void expandChild(String nodeKey) {
		String script = String.format(DMDVScriptConstants.EXPAND_CHILD_OF_NODE, new Object[] { nodeKey, 0 });
		executeJS(script);
		waitGraphCompleted();
		System.out.println("Done expandChild");
	}

	public void collapseChild(String nodeKey) {
		String script = String.format(DMDVScriptConstants.COLLAPSE_CHILD_OF_NODE, new Object[] { nodeKey, 0 });
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
		NodeDataDisplayBean employee = parseResponseToNode(nodeKey);
		String configValue = "";
		switch (option.toLowerCase()) {
		case "background":
			configValue = employee.getBackground();
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
		clickBtn("Generate");
		waitForDMDVGraphDisplayed();
	}

	public void click_btn_close_graph() {
		clickBtn("Close");
	}

	public boolean is_graph_displayed() {
		return isElementExistNow(XPATH_GRAPH);
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

	private NodeDataDisplayBean parseResponseToNode(String nodeKey) {
		String script = String.format(DMDVScriptConstants.GET_NODE_DATA_BY_KEY, new Object[] { nodeKey });
		String jsonResult = executeJS(script);
		return ConverterUtils.parse(jsonResult, NodeDataDisplayBean.class);
	}

	public List<NodeDataDisplayBean> getAllNodes() {
		String script = String.format(DMDVScriptConstants.GET_GO_DIAGRAM);
		ArrayList<String> jsonResult = executeJS(script);

		List<NodeDataDisplayBean> rs = new ArrayList<>();
		System.out.println("Founded " + jsonResult.size() + " nodes");
		for (String nodeString : jsonResult) {
			NodeDataDisplayBean node = ConverterUtils.parse(nodeString, NodeDataDisplayBean.class);
			String indicators = "";
			indicators += (node.isHasLeft() ? "LEFT," : "");
			indicators += (node.isHasRight() ? "RIGHT," : "");
			indicators += (node.isHasTop() ? "TOP," : "");
			indicators += (node.isHasBottom() ? "BOTTOM," : "");
			indicators = (indicators.length()>=1?indicators.substring(0, indicators.length()-1):"");
			String parent = (node.getGroup().equals("-1") ? "" : node.getGroup());
			System.out.println("| " + node.getKey() + "	| " + node.getText() + " | " + indicators + " |" + parent + "	|");
			rs.add(node);
		}
		return rs;
	}

	public List<LinkDataDisplayBean> getAllLinks() {
		String script = String.format(DMDVScriptConstants.GET_ALL_LINKS);
		ArrayList<String> jsonResult = executeJS(script);

		List<LinkDataDisplayBean> rs = new ArrayList<>();
		System.out.println("Found " + jsonResult.size() + " links");
		for (String nodeString : jsonResult) {
			LinkDataDisplayBean parse = ConverterUtils.parse(nodeString, LinkDataDisplayBean.class);
			String text = parse.getText() == null ? "" : parse.getText();
			System.out.println(" | " + parse.getFrom() + " | " + parse.getTo() + " | " + text + " |");
			rs.add(parse);
		}
		return rs;
	}

	public String getCurrentOrientation() {
		String script = String.format(DMDVScriptConstants.GET_GRAPH_ORIENTATION);
		Long rs = executeJS(script);
		if (rs == 0) {
			return "Left to right";
		}
		if (rs == 180) {
			return "Right to left";
		}
		if (rs == 90) {
			return "Top to bottom";
		}
		if (rs == 270) {
			return "Bottom up";
		}
		return "";
	}

	public void changeOrientation(String newOrientation) {
		clickOnElement("//div[@class='graph-header']/button[contains(@class,'orient-right-btn')]");
		clickOnElement("//span[normalize-space()='" + newOrientation + "']");
	}
}
