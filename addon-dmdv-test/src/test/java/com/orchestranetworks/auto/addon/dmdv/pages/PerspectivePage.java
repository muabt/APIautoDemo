package com.orchestranetworks.auto.addon.dmdv.pages;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.common.WebPageObject;

public class PerspectivePage extends WebPageObject {

	public PerspectivePage(WebDriver driver) {
		super(driver);
	}

	private static final String XPATH_SELECT_GRAPH = "//td[@class='ebx_Label'] //*[text()='List graph configuration']";

	public void remove_choose_dataset_div() {
		boolean isPresent = driver
				.findElements(By.xpath("//div[@class='_ebx-modeless-modal _ebx-modeless-modal-with-background']"))
				.size() > 0;
		if (isPresent) {
			clickOnElement("(//div[@class='_ebx-tree_item_content'])[1]/a");
		}
	}

	public void click_on_perspective_menu() {
		clickOnElement("//button[@title='Select perspective']");
	}

	public void select_perspective(String perspectivename) {
		clickOnElement("//div[@class='_ebx-modeless_scrollable-content']//*[text()='" + perspectivename + "']");
	}

	public void select_action(String actionname) {
		clickOnElement("//ul[@class='_ebx-tree _ebx-tree-is-root']//*[text()='" + actionname + "']");
	}

	public boolean is_select_graph_displayed() {
		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		boolean elementExistNow = isElementExistNow(XPATH_SELECT_GRAPH);
		if (!elementExistNow) {
			switchToLastIFrame();
			return isElementExistNow(XPATH_SELECT_GRAPH);
		}
		return elementExistNow;

	}
}
