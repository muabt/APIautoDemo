package com.orchestranetworks.auto.addon.dmdv.steps;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.junit.Assert;

import com.orchestranetworks.auto.addon.dmdv.IncrementalLinkDisplayBean;
import com.orchestranetworks.auto.addon.dmdv.IncrementalNodeDisplayBean;
import com.orchestranetworks.auto.addon.dmdv.pages.IncrementalGraphPage;

public class IncrementalGraphSteps {

	IncrementalGraphPage onIncrementalGraphPage;

	public void verifyIncrementalGraphDisplayed() {
		boolean isGraphDisplayed = onIncrementalGraphPage.isGraphDisplayed();
		Assert.assertEquals("Verify graph displayed: ", true, isGraphDisplayed);
	}

	public void verifyNodesDisplayed(List<List<String>> expected) {
		List<IncrementalNodeDisplayBean> allNodes = onIncrementalGraphPage.getAllNodes();

		Assert.assertEquals(expected.size(), allNodes.size());
		int totalMatch = 0;
		for (IncrementalNodeDisplayBean nodeDataDisplayBean : allNodes) {
			for (List<String> nodeValues : expected) {
				String expectedNodeKey = nodeValues.get(0);
				String expectedLabel = nodeValues.get(1);
				String expectedButton = nodeValues.get(2);
				if (nodeDataDisplayBean.getKey().equals(expectedNodeKey)) {
					totalMatch++;

					Assert.assertEquals(expectedLabel, nodeDataDisplayBean.getLabel());

					if (!StringUtils.isEmpty(expectedButton)
							&& !StringUtils.isEmpty(nodeDataDisplayBean.getButtonValue())) {
						Assert.assertEquals(expectedButton, nodeDataDisplayBean.getButtonValue());
					}
				}
			}
		}
		Assert.assertEquals(expected.size(), totalMatch);
	}

	public void expandNode(String nodeKey) {
		onIncrementalGraphPage.expandNode(nodeKey);
	}

	public void collapseNode(String nodeKey) {
		onIncrementalGraphPage.collapseNode(nodeKey);
	}

	public void verifyLinksDisplayed(List<List<String>> expected) {
		List<IncrementalLinkDisplayBean> allLinks = onIncrementalGraphPage.getAlllinks();

		Assert.assertEquals(expected.size(), allLinks.size());
		int totalMatch = 0;
		for (IncrementalLinkDisplayBean linkDataDisplayBean : allLinks) {
			for (List<String> nodeValues : expected) {
				String expectedStartNode = nodeValues.get(0);
				String expectedEndNode = nodeValues.get(1);
				if (expectedStartNode.equals(linkDataDisplayBean.getFrom())
						&& expectedEndNode.equals(linkDataDisplayBean.getTo())) {
					totalMatch++;
					break;
				}
			}
		}
		Assert.assertEquals(expected.size(), totalMatch);
	}

	public void verifyNodeDisplayed(String nodeKey, String nodeLabel) {
		IncrementalNodeDisplayBean node = onIncrementalGraphPage.getNodeByKey(nodeKey);
		Assert.assertEquals(nodeLabel, node.getLabel());
	}

	public void verifyGraphHasNoLink() {
		List<IncrementalLinkDisplayBean> allLinks = onIncrementalGraphPage.getAlllinks();
		Assert.assertEquals(0, allLinks.size());
	}

}
