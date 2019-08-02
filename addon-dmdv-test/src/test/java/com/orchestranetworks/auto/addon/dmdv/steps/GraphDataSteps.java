package com.orchestranetworks.auto.addon.dmdv.steps;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.junit.Assert;

import com.orchestranetworks.auto.addon.dmdv.LinkDataDisplayBean;
import com.orchestranetworks.auto.addon.dmdv.NodeDataDisplayBean;
import com.orchestranetworks.auto.addon.dmdv.pages.GraphDataPage;

public class GraphDataSteps {

	GraphDataPage graphDataPage;

	public void verifyNodeLabel(String nodeKey, String expectedLabel) {
		String actualLabel = graphDataPage.getNodeLabel(nodeKey);
		Assert.assertEquals(expectedLabel, actualLabel);
	}

	public void verifyAllNodes(List<List<String>> expected) {
		List<NodeDataDisplayBean> allNodes = graphDataPage.getAllNodes();
		Assert.assertEquals(expected.size(), allNodes.size());
		int totalMatch = 0;
		for (NodeDataDisplayBean nodeDataDisplayBean : allNodes) {
			for (List<String> expectedNode : expected) {
				String expectedLabel = expectedNode.get(0);
				String actualLabel = nodeDataDisplayBean.getText() == null ? "" : nodeDataDisplayBean.getText();
				if (actualLabel.equals(expectedLabel)) {
					if (expectedNode.size() >= 2) {
						//verify indicator
						String expectedIndicators = expectedNode.get(1);
						String actualIndicators = "";
						actualIndicators += (nodeDataDisplayBean.isHasLeft() ? "LEFT," : "");
						actualIndicators += (nodeDataDisplayBean.isHasRight() ? "RIGHT," : "");
						actualIndicators += (nodeDataDisplayBean.isHasTop() ? "TOP," : "");
						actualIndicators += (nodeDataDisplayBean.isHasBottom() ? "BOTTOM," : "");
						actualIndicators = (actualIndicators.length() >= 1
								? actualIndicators.substring(0, actualIndicators.length() - 1) : "");
						
						if(expectedIndicators.equals(actualIndicators)){
							if (expectedNode.size() >= 3) {
								//verify parent in container relationship
								String exptectedParent = expectedNode.get(2);
								String actualParent = nodeDataDisplayBean.getGroup().equals("-1") ? ""
										: nodeDataDisplayBean.getGroup();
								if(exptectedParent.equals(actualParent)){
									totalMatch++;
									break;
								} else {
									continue;
								}
							}
							totalMatch++;
							break;
						} else {
							continue;
						}
					}
					totalMatch++;
					break;
				}	
			}
		}
		Assert.assertEquals(expected.size(), totalMatch);
	}

	public void verifyAllLinks(List<List<String>> exptectedLinks) {
		List<LinkDataDisplayBean> allLinks = graphDataPage.getAllLinks();
		Assert.assertEquals(exptectedLinks.size(), allLinks.size());
		int totalMatch = 0;
		for (LinkDataDisplayBean linkDataDisplayBean : allLinks) {
			for (List<String> expectedLink : exptectedLinks) {
				if (linkDataDisplayBean.getFrom().equals(expectedLink.get(0))
						&& linkDataDisplayBean.getTo().equals(expectedLink.get(1))) {
					if (linkDataDisplayBean.getText() == null) {
						linkDataDisplayBean.setText("");
					}
					Assert.assertEquals(expectedLink.get(2), linkDataDisplayBean.getText());
					if (expectedLink.size() >= 4) {
						String isMultipleLink = expectedLink.get(3);
						if (isMultipleLink != null && !isMultipleLink.isEmpty()) {
							Assert.assertEquals(isMultipleLink, linkDataDisplayBean.getMultipleLinks());
						}
					}
					totalMatch++;
					break;
				}
			}
		}
		Assert.assertEquals(exptectedLinks.size(), totalMatch);
	}

	public void verifyCurrentOrientation(String expectedOrientation) {
		String currentOrientation = graphDataPage.getCurrentOrientation();
		Assert.assertEquals(expectedOrientation, currentOrientation);
	}

	public void changeOrientation(String newOrientation) {
		graphDataPage.changeOrientation(newOrientation);
	}

	public void verifyLinklabel(String fromNode, String toNode, String label) {
		List<LinkDataDisplayBean> allLinks = graphDataPage.getAllLinks();
		boolean founded = false;
		for (LinkDataDisplayBean linkDataDisplayBean : allLinks) {
			if (linkDataDisplayBean.getFrom().equals(fromNode) && linkDataDisplayBean.getTo().equals(toNode)) {
				founded = true;
				if (linkDataDisplayBean.getText() == null && StringUtils.isEmpty(label)) {
					Assert.assertTrue(true);
				} else {
					Assert.assertEquals(label, linkDataDisplayBean.getText());
				}
				break;
			}
		}
		Assert.assertTrue("Can't found the link",founded);
	}

	public void verifyNoLinks() {
		List<LinkDataDisplayBean> allLinks = graphDataPage.getAllLinks();
		Assert.assertEquals(0, allLinks.size());
	}
}
