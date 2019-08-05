package com.orchestranetworks.auto.addon.dmdv.pages;

import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.DMDVScriptConstants;
import com.orchestranetworks.auto.addon.common.WebPageObject;
import com.orchestranetworks.auto.addon.dmdv.ConverterUtils;
import com.orchestranetworks.auto.addon.dmdv.IncrementalLinkDisplayBean;
import com.orchestranetworks.auto.addon.dmdv.IncrementalNodeDisplayBean;

public class IncrementalGraphPage extends WebPageObject {

	public IncrementalGraphPage(WebDriver driver) {
		super(driver);
	}

	public boolean isGraphDisplayed() {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		switchToLastIFrame();
		return isElementExistNow("//div[@id='graphContainer']/canvas");
	}

	public List<IncrementalNodeDisplayBean> getAllNodes() {
		String script = String.format(DMDVScriptConstants.GET_GO_DIAGRAM);
		ArrayList<String> jsonResult = executeJS(script);
		System.out.println("FOUND:  " + jsonResult.size() + " nodes");

		List<IncrementalNodeDisplayBean> rs = new ArrayList<>();
		for (String nodeString : jsonResult) {
			rs.add(ConverterUtils.parse(nodeString, IncrementalNodeDisplayBean.class));
		}
		return rs;
	}

	public void waitGraphCompleted() {
		boolean inProgress = true;
		int count = 0;
		while (inProgress) {
			count++;
			String script = DMDVScriptConstants.CHECK_GRAPH_INPROGRESS;
			inProgress = (Boolean) executeJS(script);
			waitAbit(5000);
			System.err.println("Waiting collapse/expand");
			if (count == 12) {
				break;
			}
		}
	}

	public void expandNode(String nodeKey) {
		String script = String.format(DMDVScriptConstants.EXPAND_NODES_OF_INCREMENTAL_GRAPH, new Object[] { nodeKey });
		executeJS(script);
		waitGraphCompleted();
		System.out.println("Done expand");
	}

	public void collapseNode(String nodeKey) {
		String script = String.format(DMDVScriptConstants.COLLAPSE_NODES_OF_INCREMENTAL_GRAPH,
				new Object[] { nodeKey });
		executeJS(script);
		waitGraphCompleted();
		System.out.println("Done collapse");
	}

	public List<IncrementalLinkDisplayBean> getAlllinks() {
		String script = String.format(DMDVScriptConstants.GET_ALL_LINKS);
		ArrayList<String> jsonResult = executeJS(script);
		System.out.println("FOUND:  " + jsonResult.size() + " links");

		List<IncrementalLinkDisplayBean> rs = new ArrayList<>();
		for (String nodeString : jsonResult) {
			System.out.println(nodeString);
			rs.add(ConverterUtils.parse(nodeString, IncrementalLinkDisplayBean.class));
		}
		return rs;
	}

	public IncrementalNodeDisplayBean getNodeByKey(String nodeKey) {
		String script = String.format(DMDVScriptConstants.GET_NODE_DATA_BY_KEY_OF_INCREMENTAL_GRAPH,
				new Object[] { nodeKey });
		String jsonResult = executeJS(script);
		System.out.println("FOUND:  " + jsonResult);
		return ConverterUtils.parse(jsonResult, IncrementalNodeDisplayBean.class);
	}

}
