package com.orchestranetworks.auto.addon.dmdv.steps;

import org.junit.Assert;

import com.orchestranetworks.auto.addon.dmdv.pages.PerspectivePage;

public class PerspectiveSteps {
	PerspectivePage onPerspectivePage;

	public void click_on_perspective_menu() {
		onPerspectivePage.remove_choose_dataset_div();
		onPerspectivePage.click_on_perspective_menu();
	}

	public void select_perspective(String perspectivename) {
		onPerspectivePage.select_perspective(perspectivename);
	}

	public void select_action(String actionname) {
		onPerspectivePage.select_action(actionname);
	}

	public void verify_select_graph_config() {
		Assert.assertEquals("Verify Select graph configuration displayed: ", true, onPerspectivePage.is_select_graph_displayed());
	}
}
