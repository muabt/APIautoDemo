package com.orchestranetworks.auto.addon.dmdv.steps;

import com.orchestranetworks.auto.addon.common.pages.CommonPage;
import com.orchestranetworks.auto.addon.dmdv.pages.WorkflowPage;

import net.thucydides.core.annotations.Steps;

public class WorkflowSteps {

	
	CommonPage onCommonPage;
		
	WorkflowPage onWorkflowPage;

	public void click_on_data_workflows_menu() {
		onWorkflowPage.remove_choose_dataset_div();
		onCommonPage.click_menu("Data workflows");
	}

	public void click_on_workflow_launchers() {
		onWorkflowPage.click_on_workflow_launchers();
	}

	public void click_on_launch_button(String workflowname) {
		onWorkflowPage.click_on_launch_button(workflowname);
	}

	public void click_on_inbox() {
		onWorkflowPage.click_on_inbox();
	}

	public void click_on_start_work_item() {
		onWorkflowPage.click_on_start_work_item();
	}
	public String get_notification_message() {
		return onWorkflowPage.get_notification_message();
	}
}
