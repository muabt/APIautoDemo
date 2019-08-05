package com.orchestranetworks.auto.addon.dmdv.pages;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import com.orchestranetworks.auto.addon.common.WebPageObject;

public class WorkflowPage extends WebPageObject {

	public WorkflowPage(WebDriver driver) {
		super(driver);
	}

	public void remove_choose_dataset_div() {
		boolean isPresent = driver
				.findElements(By.xpath("//div[@class='_ebx-modeless-modal _ebx-modeless-modal-with-background']"))
				.size() > 0;
		if (isPresent) {
			clickOnElement("(//div[@class='_ebx-tree_item_content'])[1]/a");
		}
	}

	public void click_on_workflow_launchers() {
		clickOnElement("//span[@class='_ebx-documentation-label']//*[text()='Workflow launchers']");
	}

	public void click_on_launch_button(String workflowname) {
		switchToLastIFrame();
		clickOnElement(
				"//tr[td/button[@class='ebx_FlatButton ebx_fullWidthButtonCell ebx_ButtonLinkStyle'] and td[text()='"
						+ workflowname + "']]//td/button");
		clickOnElement("//div/button[@class='ebx_Button ebx_DefaultButton' and text()='Create and start']");
	}

	public void click_on_inbox() {
		switchOutDefaultIFrame();
		clickOnElement("//span[@class='_ebx-inbox_badge']");
	}

	public void click_on_start_work_item() {
		switchToLastIFrame();
		clickOnElement(
				"(//button[@class='ebx_FlatButton ebx_fullWidthButtonCell ebx_ButtonLinkStyle' and text()='Start work item'])[1]");
	}

	public String get_notification_message() {
		boolean isPresent = driver.findElements(By.xpath("//div[@class='_ebx-scrollable-container_content']"))
				.size() > 0;
		if (isPresent) {
			WebElement element = driver.findElement(By.xpath("//div[@class='_ebx-notification-box_list_item']"));
			System.out.println(element.getText());
			return element.getText();
		}
		return null;
	}
}
