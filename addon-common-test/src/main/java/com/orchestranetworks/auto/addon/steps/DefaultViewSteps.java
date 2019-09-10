package com.orchestranetworks.auto.addon.steps;

import com.orchestranetworks.auto.addon.pages.DefaultViewPage;

import net.thucydides.core.steps.ScenarioSteps;

public class DefaultViewSteps extends ScenarioSteps {
	DefaultViewPage onDefaultViewPage;

	public void access_menu(String menu) {
		onDefaultViewPage.getHeader().accessMenu(menu);

	}

}
