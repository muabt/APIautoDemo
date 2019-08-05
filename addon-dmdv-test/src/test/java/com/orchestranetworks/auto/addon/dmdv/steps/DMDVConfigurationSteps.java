package com.orchestranetworks.auto.addon.dmdv.steps;

import java.util.ArrayList;

import org.junit.Assert;

import com.orchestranetworks.auto.addon.common.pages.DatasetPage;
import com.orchestranetworks.auto.addon.dmdv.pages.DMDVConfigurationPage;

import net.thucydides.core.annotations.Step;

public class DMDVConfigurationSteps {
	DMDVConfigurationPage dmdvConfigurationPage;
	DatasetPage onDatasetPage;

	@Step
	public void import_config_file(String fileName) throws Throwable {
		dmdvConfigurationPage.clickMenuAdministration();
		dmdvConfigurationPage.clickMenuVisualization();
		dmdvConfigurationPage.clickButtonAction();
		dmdvConfigurationPage.clickMenuImport();
		dmdvConfigurationPage.chooseConfigFile(fileName);
		dmdvConfigurationPage.clickButtonImport();
	}

	@Step
	public void open_configuration_page(String name) throws Throwable {
		dmdvConfigurationPage.clickMenuAdministration();
		dmdvConfigurationPage.clickMenuVisualization();
		dmdvConfigurationPage.clickSubMenuLinkConfiguration();
		dmdvConfigurationPage.clickOnFilterButton();
		dmdvConfigurationPage.expandTextSearch();
		dmdvConfigurationPage.clickSelectAll();
		dmdvConfigurationPage.clickConfigurationCheckBox();
		dmdvConfigurationPage.fillToTextSearch(name);
		dmdvConfigurationPage.clickBtn("Apply", 2);
		dmdvConfigurationPage.clickOnLinkConfiguration();
	}

	// MuaBT add
	@Step
	public void open_table_configuration_page(String name, String tableName) throws Throwable {
		onDatasetPage.remove_choose_dataset_div();
		dmdvConfigurationPage.clickMenuAdministration();
		dmdvConfigurationPage.clickMenuVisualization();
		dmdvConfigurationPage.clickSubMenuTableConfiguration();
		dmdvConfigurationPage.clickOnFilterButton();
		dmdvConfigurationPage.expandTextSearch();
		dmdvConfigurationPage.clickSelectAll();
		dmdvConfigurationPage.clickConfigurationCheckBox();
		dmdvConfigurationPage.fillToTextSearch(name);
		dmdvConfigurationPage.clickBtn("Apply", 2);
		dmdvConfigurationPage.clickOnTableConfiguration(tableName);
	}

	//
	public void open_savedgraph_page() {
		dmdvConfigurationPage.clickMenuAdministration();
		dmdvConfigurationPage.clickMenuVisualization();
		dmdvConfigurationPage.clickPreferences();
		dmdvConfigurationPage.clickSavedgraph();
	}

	public void searchSavedGraphByNameAndUser(String graphName, String name) {
		dmdvConfigurationPage.clickOnFilterButton();
		dmdvConfigurationPage.expandTextSearch();
		dmdvConfigurationPage.clickSelectAll();
		dmdvConfigurationPage.clickNameCheckBox();
		dmdvConfigurationPage.fillToTextSearch(graphName);
		dmdvConfigurationPage.clickBtn("Apply", 2);
	}

	public void delete_saved_graph_with_something_and_user_profile_something(String graphName, String userProfile) {
		dmdvConfigurationPage.clickCheckbox1(graphName, userProfile);
		dmdvConfigurationPage.clickActions();
		dmdvConfigurationPage.clickDeleteSavedGraph();
	}
	
	public void delete_saved_graph_with_something_and_user_something(String graphname, String userName) {
		dmdvConfigurationPage.clickCheckbox2(graphname, userName);
		dmdvConfigurationPage.clickActions();
		dmdvConfigurationPage.clickDeleteSavedGraph();
	}

	@Step
	public void change_to_dataset_page() throws Throwable {
		dmdvConfigurationPage.clickMenuData();
	}

	public void click_on_link_configuration(int number) {
		dmdvConfigurationPage.click_on_link_configuration(number);
	}

	public void input_to_conditional_filter_text_box(String text) {
		dmdvConfigurationPage.input_to_conditional_filter_text_box(text);
	}

	public void click_save_button() {
		dmdvConfigurationPage.clickBtn("Save");
	}

	public String get_error_message() {
		return dmdvConfigurationPage.get_error_message();
	}
	public String get_text_popup_message() {
		return dmdvConfigurationPage.get_text_popup_message();
	}

	// MuaBT add
	public void click_pen_icon_default() {
		dmdvConfigurationPage.clickOnElement("//button[@class='ebx_FlatButton ebx_IconButton ebx_ValueEditable']");

	}

	public void click_wizard_icon_default() {
		dmdvConfigurationPage.clickOnElement("//tr[td/label[text()='Default label']]//button[@title='Select an icon']");

	}

	public void click_arrow_icon_default() {
		dmdvConfigurationPage.clickOnElement(
				"(//div[@class='ebx_wizardTreePane']//table[contains(@class,'ebx_wizardLineUnable')]//tbody/tr/td[1])[1]");

	}

	public void click_wizard_icon_localize() {
		dmdvConfigurationPage
				.clickOnElement("(//tr[td/label[text()='Localized Label']]//button[@title='Select an icon'])[1]");

	}

	public void click_arrow_icon_localize() {
		dmdvConfigurationPage.clickOnElement(
				"//div[@class='ebx_wizardTreePane']//table[contains(@class,'ebx_wizardLineUnable')]//tbody/tr/td[1]");

	}

	public void click_arrow_icon_default_link() {
		dmdvConfigurationPage.clickOnElement(
				"(//div[@class='ebx_wizardTreePane']//table[contains(@class,'ebx_wizardLineUnable')]//tbody/tr/td[1])[1]");
		dmdvConfigurationPage.clickOnElement(
				"(//div[@class='ebx_wizardTreePane']//table[contains(@class,'ebx_wizardLineUnable')]//tbody/tr/td[1])[2]");

	}

	public void click_wizard_icon_localize_link() {
		dmdvConfigurationPage.clickOnElement(
				"//*[@class=\"ebx_CollapsibleBlockContent ebx_HidingContainer\"]//*[@class=\"ebx_FlatButton ebx_IconButton ebx_Wizard\"]");

	}

	public void click_arrow_icon_localize_link() {
		dmdvConfigurationPage.clickOnElement(
				"(//div[@class='ebx_wizardTreePane']//table[contains(@class,'ebx_wizardLineUnable')]//tbody/tr/td[1])[1]");
		dmdvConfigurationPage.clickOnElement(
				"(//div[@class='ebx_wizardTreePane']//table[contains(@class,'ebx_wizardLineUnable')]//tbody/tr/td[1])[2]");
	}

	public void clickMenuConfiguration() {
		dmdvConfigurationPage.clickMenuConfiguration();

	}

	public ArrayList<String> getListField() {
		return dmdvConfigurationPage.getListField();
	}

	public ArrayList<String> getListFieldLocalized() {
		return dmdvConfigurationPage.getListFieldLocalized();
	}
	
	//TrangLT
	public void click_outside() {
		dmdvConfigurationPage.click_outside();
		
	}
	
	public void click_node_style() {
		dmdvConfigurationPage.click_node_style();
	}

	public void input_to_color_styles_default(String value) {
		
		dmdvConfigurationPage.input_to_border_color(value);
		dmdvConfigurationPage.input_to_background_color(value);	
		dmdvConfigurationPage.input_to_label_color(value);
	//	dmdvConfigurationPage.input_to_border_width(value);
	//	dmdvConfigurationPage.input_to_border_style();

	}

	public String get_error_message_under_style() {
		return dmdvConfigurationPage.get_error_message_under_style();
	}

	public void input_to_border_width_default(String value) {
		dmdvConfigurationPage.input_to_border_width(value);
		
	}

	public void input_to_border_style_default(String value) {
		dmdvConfigurationPage.input_to_border_style(value);
		
	}

	public String get_value_border_style(String value) {
		return dmdvConfigurationPage.get_text_border_style(value);
	}

	public String get_value_border_width() {
		return dmdvConfigurationPage.get_text_border_width();

	}

	public String get_value_border_color_styles_default() {
		return dmdvConfigurationPage.get_border_color_styles_default();
	}
	
	public String get_value_background_color_styles_default() {
		return dmdvConfigurationPage.get_background_color_styles_default();

	}
	
	public String get_value_label_color_styles_default() {
		return dmdvConfigurationPage.get_label_color_styles_default();
	}
	
	public void input_color_style_by_color_picker() {
		dmdvConfigurationPage.input_color_style_by_color_picker();
		
	}

	public void input_for_background_color(String labelinlegend, String color, String condition) {
		dmdvConfigurationPage.select_add_icon_background();
		dmdvConfigurationPage.input_to_label_in_legend_background(labelinlegend);
		dmdvConfigurationPage.input_to_color_background(color);	
		dmdvConfigurationPage.input_to_condition_background(condition);
		dmdvConfigurationPage.click_outside(); 
//		dmdvConfigurationPage.clickBtn("Save");
		
	}
	
//	public void input_for_background_colorx(String labelinlegend) {
//		dmdvConfigurationPage.select_add_icon();
//		dmdvConfigurationPage.input_to_label_in_legendx(labelinlegend);
//		dmdvConfigurationPage.click_outside();
//	}

	public String get_value_labelinlegend_background() {
		return dmdvConfigurationPage.get_value_labelinlegend_background();
	}

	public String get_value_color_background() {
		return dmdvConfigurationPage.get_value_color_background();
	}

	public String get_value_condition_background() {
		return dmdvConfigurationPage.get_value_condition_background();
	}

	public void select_delete_icon_background() {
		dmdvConfigurationPage.select_delete_icon_background();
		
	}

	public void input_for_label_color(String labelinlegend, String color, String condition) {
		dmdvConfigurationPage.select_add_icon_label();
		dmdvConfigurationPage.input_to_label_in_legend_label(labelinlegend);
		dmdvConfigurationPage.input_to_color_label(color);	
		dmdvConfigurationPage.input_to_condition_label(condition);
		dmdvConfigurationPage.click_outside(); 
//		dmdvConfigurationPage.clickBtn("Save");
		
	}

	public String get_value_labelinlegend_label() {
		return dmdvConfigurationPage.get_value_labelinlegend_label();
	}

	public String get_value_color_label() {
		return dmdvConfigurationPage.get_value_color_label();
	}

	public String get_value_condition_label() {
		return dmdvConfigurationPage.get_value_condition_label();
	}

	public void select_delete_icon_label() {
		dmdvConfigurationPage.select_delete_icon_label();
		
	}
	
	public void input_for_border_color(String labelinlegend, String color, String condition) {
		dmdvConfigurationPage.select_add_icon_border();
		dmdvConfigurationPage.input_to_label_in_legend_border(labelinlegend);
		dmdvConfigurationPage.input_to_color_border(color);	
		dmdvConfigurationPage.input_to_condition_border(condition);
		dmdvConfigurationPage.click_outside(); 
//		dmdvConfigurationPage.clickBtn("Save");
		
	}

	public String get_value_labelinlegend_border() {
		return dmdvConfigurationPage.get_value_labelinlegend_border();
	}

	public String get_value_color_border() {
		return dmdvConfigurationPage.get_value_color_border();
	}

	public String get_value_condition_border() {
		return dmdvConfigurationPage.get_value_condition_border();
	}

	public void select_delete_icon_border() {
		dmdvConfigurationPage.select_delete_icon_border();
		
	}
	

	public void input_for_border_style(String labelinlegend, String style, String condition) {
		dmdvConfigurationPage.select_add_icon_border_style();
		dmdvConfigurationPage.input_to_label_in_legend_border_style(labelinlegend);
		dmdvConfigurationPage.input_value_to_border_style(style);	
		dmdvConfigurationPage.input_to_condition_border_style(condition);
		dmdvConfigurationPage.click_outside(); 
//		dmdvConfigurationPage.clickBtn("Save");
		
	}

	public String get_value_labelinlegend_border_style() {
		return dmdvConfigurationPage.get_value_labelinlegend_border_style();
	}

	public String get_value_style_border_style() {
		return dmdvConfigurationPage.get_value_style_border_style();
	}

	public String get_value_condition_border_style() {
		return dmdvConfigurationPage.get_value_condition_border_style();
	}

	public void select_delete_icon_border_style() {
		dmdvConfigurationPage.select_delete_icon_border_style();
		
	}
	
	public void input_for_border_width(String labelinlegend, String width, String condition) {
		dmdvConfigurationPage.select_add_icon_border_width();
		dmdvConfigurationPage.input_to_label_in_legend_border_width(labelinlegend);
		dmdvConfigurationPage.input_value_to_border_width(width);	
		dmdvConfigurationPage.input_to_condition_border_width(condition);
		dmdvConfigurationPage.click_outside(); 
//		dmdvConfigurationPage.clickBtn("Save");
		
	}

	public String get_value_labelinlegend_border_width() {
		return dmdvConfigurationPage.get_value_labelinlegend_border_width();
	}

	public String get_value_color_border_width() {
		return dmdvConfigurationPage.get_value_color_border_width();
	}

	public String get_value_condition_border_width() {
		return dmdvConfigurationPage.get_value_condition_border_width();
	}

	public void select_delete_icon_border_width() {
		dmdvConfigurationPage.select_delete_icon_border_width();
		
	}
//

	public void verify_saved_graph_with_something_and_user_profile_something(String graphName, String userName) {
		String xpath = "//tr[td[text()='" + graphName + "'] and td[text()='U" + userName + "']]";
		boolean elementExistNow = dmdvConfigurationPage.isElementExistNow(xpath);
		Assert.assertTrue(elementExistNow);
	}

	public void verify_saved_graph_with_something_and_user_something(String graphName, String user) {
		String xpath = "//tr[td[text()='" + graphName + "'] and td[text()='B" + user + "']]";
		boolean elementExistNow = dmdvConfigurationPage.isElementExistNow(xpath);
		Assert.assertTrue(elementExistNow);
	}
}
