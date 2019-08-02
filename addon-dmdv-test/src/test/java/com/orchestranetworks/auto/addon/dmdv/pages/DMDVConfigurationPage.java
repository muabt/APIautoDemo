package com.orchestranetworks.auto.addon.dmdv.pages;

import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;

import com.orchestranetworks.auto.addon.WebPageObject;

import net.serenitybdd.core.pages.WebElementState;

public class DMDVConfigurationPage extends WebPageObject {
	
	private static final String DMDV_ADDON_FULL_PRODUCT_NAME = "TIBCO EBX™ Data Model and Data Visualization Add-on";

	public DMDVConfigurationPage(WebDriver driver) {
		super(driver);
	}

	public void clickMenuAdministration() {
		remove_choose_dataset_div();
		switchOutDefaultIFrame();
		waitElementToBePresent("//a[@title='Administration']").waitUntilClickable().click();
	}

	public void clickMenuData() {
		switchOutDefaultIFrame();
		waitElementToBePresent("//a[@title='Data']").waitUntilClickable().click();
	}

	public void clickMenuVisualization() {
		switchToIFrame("ebx-legacy-component");
		waitElementToBePresent("//td//*[text()='" + DMDVConfigurationPage.DMDV_ADDON_FULL_PRODUCT_NAME + "']").waitUntilClickable().click();
	}

	public void clickPreferences() {
		clickOnElement("(//*[@class=\"ygtvcell ygtvlp\"])[1]");
	}

	public void clickSavedgraph() {
		clickOnElement("(//*[@class=\"ebx_RawLabel\"]/span)[5]");
	}

	public void clickButtonAction() {
		waitForAllLoadingCompleted();
		clickBtn("Actions");
	}

	public void clickMenuImport() {
		waitElementToBePresent("//*[@id='ebx_MenuForMenuButtons']//a[text()='Import']").waitUntilClickable().click();
	}

	public void chooseConfigFile(String fileName) {
		waitElementToBePresent("//select[@id='__domain__sessionContext__dataSpace__archiveLocationForImport']")
				.waitUntilClickable().click();
		clickOnElement("//select[@id='__domain__sessionContext__dataSpace__archiveLocationForImport']/option[text()='"
				+ fileName + "']");
	}

	public void clickButtonImport() {
		clickBtn("Import");
	}

	// MuaBT add
	public void clickMenuConfiguration() {
		clickOnElement("(//a[span[span[text()='Configuration']]])");
	}

	public void clickSubMenuConfiguration() {
		clickOnElement("(//a[span[span[text()='Configuration']]])[2]");
	}

	public void clickOnConfiguration(String name) {
		Actions action = new Actions(driver);
		WebElement element = driver.findElement(
				By.xpath("//*[@id='ebx_workspaceTable_mainScroller']/table/tbody/tr[td[text()='" + name + "']]"));
		action.doubleClick(element).perform();
		waitForAllLoadingCompleted();
	}

	public void clickOnFilterButton() {
		clickOnElement("//*[@id='ebx_filtersButton']");
	}

	public void fillToTextSearch(String name) {
		waitTypeAndTab("//*[@id='FILTER_1_filterContent']//input[../div[text()='Field contains:']]", name);
	}

	public void expandTextSearch() {
		clickOnElement("//*[@id='FILTER_1_filterExpandCollapse_label']");
	}

	public void click_on_link_configuration(int number) {
		waitElementToBePresent("(//div[@class='ebx_tvMainScroller'])[3]/table/tbody/tr/td[text()='Lines']")
				.waitUntilClickable().click();
		Actions action = new Actions(driver);
		WebElement element = driver
				.findElement(By.xpath("(//div[@class='ebx_tvMainScroller'])[3]/table/tbody/tr/td[text()='Lines']"));
		action.doubleClick(element).perform();
		waitAbit(1000);
	}

	public void input_to_conditional_filter_text_box(String text) {
		waitTypeAndTab(
				"//table[@class='ebx_FieldListNoMargin']/tbody/tr[td/label[text()='Conditional Filter']]/td/div/div/input[1]",
				text);
	}

	public void clickSubMenuLinkConfiguration() {
		clickOnElement("//a[span//span[text()='Link configuration']]");
	}

	public void clickSelectAll() {
		clickOnElement("//*[@id='ebx_SelectAll_fields']");
	}

	public void clickConfigurationCheckBox() {
		clickOnElement("//*[@id='ebx_UISearchFilter_fields__fkConfiguration']");
	}

	public void clickNameCheckBox() {
		clickOnElement("//input[@type='checkbox' and @value='/name']");
	}

	public void clickOnAddItemDropdownBox() {
		clickOnElement("//div[input[@value='Select an item to add']]/button");
	}

	public void clickOnAddItemDropdownBox_ChooseConfiguration(String name) {
		waitTypeAndTab("//input[@value='Select an item to add']", name);
	}

	public void clickOnLinkConfiguration() {
		waitElementToBePresent(
				"//table[@class='ebx_tableCellWithButtonOnRight_table']/tbody/tr/td[contains(text(), 'TableA')]")
						.waitUntilClickable();
		Actions action = new Actions(driver);
		WebElement element = driver.findElement(By.xpath(
				"//table[@class='ebx_tableCellWithButtonOnRight_table']/tbody/tr/td[contains(text(), 'TableA')]"));
		action.doubleClick(element).perform();
		waitAbit(1000);
	}

	public String get_error_message() {
		boolean isPresent = driver.findElements(By.xpath("//div[@class='ebx_MessageContainer']/div/div")).size() > 0;
		if(isPresent)
           {
			WebElement element = driver.findElement(By.xpath("//div[@class='ebx_MessageContainer']/div/div"));
			return element.getText();
				}
		return null;
		}



//TrangLT	
	public String get_error_message_under_style() {
		boolean isPresent = driver.findElements(By.xpath("//div[@class='ebx_MessageContainer']/div/div")).size() > 0;
		if(isPresent)
           {
			WebElement element = driver.findElement(By.xpath("//div[@class='ebx_MessageContainer']/div/div"));
			return element.getText();
				}
		return null;
		}
	
	public String get_text_popup_message() {
		switchToIFrame("ebx-legacy-component");
		WebElement element = driver.findElement(By.xpath("//div[@class='_ebx-scrollable-container_content']/div"));
		return element.getText();
	}

	public void click_btn_close_popup() {
		clickOnElement("//div[@class='_ebx-toolbar']");

	}
//

	// MuaBT add
	public void clickOnTable() {
		waitElementToBePresent("//table[@class='ebx_tvMain']/tbody/tr/td[contains(text(), 'TableA')]")
				.waitUntilClickable();
		Actions action = new Actions(driver);
		WebElement element = driver
				.findElement(By.xpath("//table[@class='ebx_tvMain']/tbody/tr/td[contains(text(), 'TableA')]"));
		action.doubleClick(element).perform();
		waitAbit(1000);

	}

	public void clickSubMenuTableConfiguration() {
		clickOnElement("//a[span//span[text()='Table configuration']]");
	}

	public void clickOnTableConfiguration(String tableName) {
		waitElementToBePresent("//div[@class='ebx_tvMainScroller']//td[text()='TableA']").waitUntilClickable();
		Actions action = new Actions(driver);
		WebElement element = driver
				.findElement(By.xpath("//div[@class='ebx_tvMainScroller']//td[text()='" + tableName + "']"));
		action.doubleClick(element).perform();
		waitAbit(1000);
	}

	public ArrayList<String> getListField() {
		ArrayList<String> listField = new ArrayList<String>();
		String xPathField = "//tr[td/label[text()='Default label']]//table[contains(@class,'ebx_wizardLineEnable')]//td[@class='ygtvcell ygtvhtml ygtvcontent']";
		int size = findAllElement(xPathField).size();
		for (int i = 1; i <= size; i++) {
			String fieldName = getText("(" + xPathField + ")" + "[" + i + "]");
			listField.add(fieldName);
		}
		return listField;

	}
	
	public ArrayList<String> getListFieldLocalized() {
		ArrayList<String> listField = new ArrayList<String>();
		String xPathField = "//tr[td/label[text()='Localized label']]//table[contains(@class,'ebx_wizardLineEnable')]//td[@class='ygtvcell ygtvhtml ygtvcontent']";
		int size = findAllElement(xPathField).size();
		for (int i = 1; i <= size; i++) {
			String fieldName = getText("(" + xPathField + ")" + "[" + i + "]");
			listField.add(fieldName);
		}
		return listField;

	}
	
	public void clickCheckbox1(String graphName, String userProfile) {
		clickOnElement("//tr[td[text()='" + graphName + "'] and td[text()='U" + userProfile + "']]/td[1]/label/input");
	}
	
	public void clickCheckbox2(String graphName, String userName) {
		clickOnElement("//tr[td[text()='" + graphName + "'] and td[text()='B" + userName + "']]/td[1]/label/input");
	}

	public void clickActions() {
		clickOnElement("//div[@id='ebx_WorkspaceToolbar']//button[text()='Actions']");
	}

	public void clickDeleteSavedGraph() {
		clickOnElement("//div[@id='ebx_MenuForMenuButtons']//a[text()='Delete saved graph']");

	}
	
	
// TrangLT
	
	public void click_outside() {
       clickOnElement(
				"//div[@class='ebx_WorkspaceFormTabview_Header']");
		
	}
	
	public void click_node_style() {
		clickOnElement(
				"//a[em/span[text()='Node Style']]");
	}
	
	public void input_to_background_color(String value) {
		if(!value.isEmpty()) {
		waitTypeAndTab(
				"//div[@class='ebx_ColorPickerPreview_container']/input[contains(@name, 'background')]",
				"#"+ value);
		} else
			waitTypeAndTab(
					"//div[@class='ebx_ColorPickerPreview_container']/input[contains(@name, 'background')]",value);
		
	}

	public void input_to_border_color(String value) {
		if(!value.isEmpty()) {
		waitTypeAndTab(
				"//div[@class='ebx_ColorPickerPreview_container']/input[contains(@name, 'border')]",
				"#"+ value);
		} else
			waitTypeAndTab(
					"//div[@class='ebx_ColorPickerPreview_container']/input[contains(@name, 'border')]",
					 value);
		
	}

	public void input_to_border_width(String value) {
		waitTypeAndTab(
				"//input[contains(@name, 'borderWidth')]",
				value);
		
	}

	public void input_to_border_style(String value) {
		clickOnElement(
				"//select[contains(@name, 'borderStyle')]");
		clickOnElement(
				"//select[contains(@name, 'borderStyle')]/option[. = '" + value + "']");
		
	}

	public void input_to_label_color(String value) {
		if(!value.isEmpty()) {
		waitTypeAndTab(
				"//div[@class='ebx_ColorPickerPreview_container']/input[contains(@name, 'text')]",
				"#"+ value);
		} else 
			waitTypeAndTab(
					"//div[@class='ebx_ColorPickerPreview_container']/input[contains(@name, 'text')]",
					value);
		
	}

	public String get_text_border_style(String value) {
		clickOnElement(
				"//select[contains(@name, 'borderStyle')]");
		WebElement element = driver.findElement(By.xpath("//select[contains(@name, 'borderStyle')]/option[. = '" + value + "']"));
		return element.getText();
	}

	public String get_text_border_width() {
		WebElement element = driver.findElement(By.xpath("//input[contains(@name, 'borderWidth')]"));
		return element.getAttribute("value");	
	}

	public String get_border_color_styles_default() {
			WebElement element1 = driver.findElement(By.xpath("//div[@class='ebx_ColorPickerPreview_container']/input[contains(@name, 'border')]"));
		return element1.getAttribute("value");	

	}
	
	public String get_background_color_styles_default() {
		WebElement element = driver.findElement(By.xpath("//div[@class='ebx_ColorPickerPreview_container']/input[contains(@name, 'background')]"));
		return element.getAttribute("value");	

	}
	
	public String get_label_color_styles_default() {
		WebElement element2 = driver.findElement(By.xpath("//div[@class='ebx_ColorPickerPreview_container']/input[contains(@name, 'text')]"));
		return element2.getAttribute("value");	
	}
	
	public void input_color_style_by_color_picker() {
		clickOnElement(
				"//button[@title = 'Color picker']/span[@class ='ebx_Icon']");
		//switchToIFrame("ebx-legacy-component");
		clickOnElement(
				"//div[@class='yui-picker-swatch']");
		
	}
	
	public void select_add_icon_background() {
		clickOnElement(
				"//button[@title = 'Add an occurrence']/span");
		
	}

	public void select_delete_icon_background() {
		clickOnElement(
				"//button[contains(@id, 'backgroundColor_5b') and @title = 'Delete this occurrence.']/span");
		
	}

	public void input_to_label_in_legend_background(String labelinlegend) {
		waitTypeAndTab(
				"//tr/td/div/input[contains(@name, 'backgroundColor_5b_')]", labelinlegend );
		
	}
	
//	public void input_to_label_in_legendx(String labelinlegend) {
//	//By xPath = By.xpath("//tr/td/div/input[contains(@name, 'backgroundColor_5b_')]/preceding-sibling::*)+1");
//	//int position = driver.findElements(xPath).size() + 1;
//	boolean isPresent = driver.findElements(By.xpath("//tr/td/div/input[contains(@name, 'backgroundColor_5b_')]")).size() > 0;
//	if(isPresent==false){
//		
////		clickOnElement(
////				"//button[@title = 'Add an occurrence']/span[@class ='ebx_Icon']");
//		waitTypeAndTab(
//				
//				"//tr/td/div/input[contains(@name, 'backgroundColor_5b_')];", labelinlegend);
//	} 
//	else {
//
// 		waitTypeAndTab(
//					"//tr/td/div/input[contains(@name, 'backgroundColor_5b_')]", labelinlegend);
//
//		}
//}

		
	
	public void input_to_color_background(String color) {
		if (!color.isEmpty()) {	
			waitTypeAndTab(
					"//div[@class = 'ebx_ColorPickerPreview_container']/input[contains(@name,'backgroundColor')]", "#"+color );
			} else
				waitTypeAndTab(
						"//div[@class = 'ebx_ColorPickerPreview_container']/input[contains(@name,'backgroundColor')]", color );
		
	}

	public void input_to_condition_background(String condition) {
		waitTypeAndTab(
				"//input[contains(@name,'condition')]", condition );
		
	}


	public String get_value_labelinlegend_background() {
		WebElement element = driver.findElement(By.xpath("//tr[@class = 'ebx_Field ebx_ComplexField ebx_HidingContainer']/td/div/input"));
		return element.getAttribute("value");	
	}

	public String get_value_color_background() {
		WebElement element = driver.findElement(By.xpath("//div[@class = 'ebx_ColorPickerPreview_container']/input[contains(@name,'backgroundColor')]"));
		return element.getAttribute("value");	
	}

	public String get_value_condition_background() {
		WebElement element = driver.findElement(By.xpath("//input[contains(@name,'condition')]"));
		return element.getAttribute("value");	
	}

	public void select_add_icon_label() {
		clickOnElement(
				"//div[contains(@id, 'labelColoreditor')]/button/span");
		
	}
	
	public void select_delete_icon_label() {
		clickOnElement(
				"//button[contains(@id, 'labelColor_5b') and @title = 'Delete this occurrence.']/span");
		
	}
	
	public void input_to_label_in_legend_label(String labelinlegend) {
		waitTypeAndTab(
				"//tr/td/div/input[contains(@name, 'labelColor_5b_')]", labelinlegend );
		
	}

	public void input_to_color_label(String color) {
		if (color.isEmpty()) {		
			waitTypeAndTab(
				"//div[@class = 'ebx_ColorPickerPreview_container']/input[contains(@name,'labelColor')]", color );
			} else
		
		waitTypeAndTab(
				"//div[@class = 'ebx_ColorPickerPreview_container']/input[contains(@name,'labelColor')]", "#"+color );
		
	}

	public void input_to_condition_label(String condition) {
		waitTypeAndTab(
				"//tr/td[3]/div/div/input[contains(@name, 'labelColor_5b_')]", condition );
		
	}

	public String get_value_labelinlegend_label() {
		WebElement element = driver.findElement(By.xpath("//tr/td/div/input[contains(@name, 'labelColor_5b_')]"));
		return element.getAttribute("value");	
	}

	public String get_value_color_label() {
		WebElement element = driver.findElement(By.xpath("//div[@class = 'ebx_ColorPickerPreview_container']/input[contains(@name,'labelColor')]"));
		return element.getAttribute("value");	
	}

	public String get_value_condition_label() {
		WebElement element = driver.findElement(By.xpath("//tr/td[3]/div/div/input[contains(@name, 'labelColor_5b_')]"));
		return element.getAttribute("value");	
	}

	public void select_add_icon_border() {
		clickOnElement(
				"//div[contains(@id, 'borderColoreditor')]/button/span");
		
	}
	
	public void select_delete_icon_border() {
		clickOnElement(
				"//button[contains(@id, 'borderColor_5b') and @title = 'Delete this occurrence.']/span");
		
	}
	
	public void input_to_label_in_legend_border(String labelinlegend) {
		waitTypeAndTab(
				"//tr/td/div/input[contains(@name, 'borderColor_5b_')]", labelinlegend );
		
	}

	public void input_to_color_border(String color) {
		if (color.isEmpty()) {		
			waitTypeAndTab(
				"//div[@class = 'ebx_ColorPickerPreview_container']/input[contains(@name,'borderColor')]", color );
			} else
		
		waitTypeAndTab(
				"//div[@class = 'ebx_ColorPickerPreview_container']/input[contains(@name,'borderColor')]", "#"+color );
		
	}

	public void input_to_condition_border(String condition) {
		waitTypeAndTab(
				"//tr/td[3]/div/div/input[contains(@name, 'borderColor_5b_')]", condition );
		
	}

	public String get_value_labelinlegend_border() {
		WebElement element = driver.findElement(By.xpath("//tr/td/div/input[contains(@name, 'borderColor_5b_')]"));
		return element.getAttribute("value");	
	}

	public String get_value_color_border() {
		WebElement element = driver.findElement(By.xpath("//div[@class = 'ebx_ColorPickerPreview_container']/input[contains(@name,'borderColor')]"));
		return element.getAttribute("value");	
	}

	public String get_value_condition_border() {
		WebElement element = driver.findElement(By.xpath("//tr/td[3]/div/div/input[contains(@name, 'borderColor_5b_')]"));
		return element.getAttribute("value");	
	}

	
	public void select_add_icon_border_style() {
		clickOnElement(
				"//div[contains(@id, 'borderStyleeditor')]/button/span");
		
	}
	
	public void select_delete_icon_border_style() {
		clickOnElement(
				"//button[contains(@id, 'borderStyle_5b') and @title = 'Delete this occurrence.']/span");
		
	}
	
	public void input_to_label_in_legend_border_style(String labelinlegend) {
		waitTypeAndTab(
				"//tr/td/div/input[contains(@name, 'borderStyle_5b_')]", labelinlegend );
		
	}

	public void input_value_to_border_style(String style) {
		
	clickOnElement(
			"//td/div/div/button[@title = 'Open drop-down list' ]");
	String styleXpath = "";
	if(style.contains(" ")){
		String[] styleArray = style.split(" ");
		for (int i = 0; i < styleArray.length-1; i++) {
			styleXpath += "contains(text(),'"+styleArray[i]+"') and ";
		}
		styleXpath += "contains(text(),'"+styleArray[styleArray.length-1]+"')";
	} else {
		styleXpath = "text() = '"+style+"'";
	}
	clickOnElement(
			"//div/div/div/div/div["+styleXpath+"]");
	
	}

	public void input_to_condition_border_style(String condition) {
		waitTypeAndTab(
				"//tr/td[3]/div/div[contains(@class, 'ebx_FieldDecorator')]/input[contains(@name, 'borderStyle_5b_')]", condition );
		
	}

	public String get_value_labelinlegend_border_style() {
		WebElement element = driver.findElement(By.xpath("//tr/td/div/input[contains(@name, 'borderStyle_5b_')]"));
		return element.getAttribute("value");	
	}

	public String get_value_style_border_style() {
		WebElement element = driver.findElement(By.xpath("//td/div/div/input[contains(@class,'ebx_InputWithEmptyButton')]"));
		return element.getAttribute("value");	
	}

	public String get_value_condition_border_style() {
		WebElement element = driver.findElement(By.xpath("//tr/td[3]/div/div[contains(@class, 'ebx_FieldDecorator')]/input[contains(@name, 'borderStyle_5b_')]"));
		return element.getAttribute("value");	
	}
	
	public void select_add_icon_border_width() {
	clickOnElement(
			"//div[contains(@id, 'borderWidtheditor')]/button/span");
	
	}

public void select_delete_icon_border_width() {
	clickOnElement(
			"//button[contains(@id, 'borderWidth_5b') and @title = 'Delete this occurrence.']/span");
	
	}

public void input_to_label_in_legend_border_width(String labelinlegend) {
	waitTypeAndTab(
			"//tr/td/div/input[contains(@name, 'borderWidth_5b_')]", labelinlegend );
	
	}

public void input_value_to_border_width(String width) {

	waitTypeAndTab(
			"//td/div/input[contains(@name,'borderWidth_5b_0_5d___value')]", width );
	
	}

public void input_to_condition_border_width(String condition) {
	waitTypeAndTab(
			"//tr/td[3]/div/div/input[contains(@name, 'borderWidth_5b_')]", condition );
	
	}

public String get_value_labelinlegend_border_width() {
	WebElement element = driver.findElement(By.xpath("//tr/td/div/input[contains(@name, 'borderWidth_5b_')]"));
	return element.getAttribute("value");	
	}

public String get_value_color_border_width() {
	WebElement element = driver.findElement(By.xpath("//td/div/input[contains(@name,'borderWidth_5b_0_5d___value')]"));
	return element.getAttribute("value");	
	}

public String get_value_condition_border_width() {
	WebElement element = driver.findElement(By.xpath("//tr/td[3]/div/div/input[contains(@name, 'borderWidth_5b_')]"));
	return element.getAttribute("value");	
	}	
	
	public void remove_choose_dataset_div() {
		boolean isPresent = driver
				.findElements(By.xpath("//div[@class='_ebx-modeless-modal _ebx-modeless-modal-with-background']"))
				.size() > 0;
		if (isPresent) {
			clickOnElement("(//div[@class='_ebx-tree_item_content'])[1]/a");
			waitForPresenceOfElement("//div[@class='_ebx-toolbar-layout _ebx-navigation-toolbar']");
		}
	}
}
