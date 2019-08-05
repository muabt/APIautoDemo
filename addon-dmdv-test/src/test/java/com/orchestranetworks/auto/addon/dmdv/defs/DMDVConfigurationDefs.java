package com.orchestranetworks.auto.addon.dmdv.defs;

import java.util.List;

import org.junit.Assert;

import com.orchestranetworks.auto.addon.dmdv.steps.DMDVConfigurationSteps;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import net.thucydides.core.annotations.Steps;

public class DMDVConfigurationDefs {

	@Steps
	DMDVConfigurationSteps dmdvConfigurationSteps;

	@Given("^import config file \"([^\"]*)\"$")
	public void import_config_file(String fileName) throws Throwable {
		dmdvConfigurationSteps.import_config_file(fileName);
		dmdvConfigurationSteps.change_to_dataset_page();
	}

	@Given("^open configuration with name \"([^\"]*)\"$")
	public void open_configuration_with_name_something(String name) throws Throwable {
		dmdvConfigurationSteps.open_configuration_page(name);
	}

	@Given("^click on link configuration$")
	public void click_on_link_configuration() throws Throwable {
		dmdvConfigurationSteps.click_on_link_configuration(1);
	}

	@Then("^error message \"([^\"]*)\" should be display$")
	public void error_message_something_should_be_display(String msg) throws Throwable {
		String acutalmsg = dmdvConfigurationSteps.get_error_message();
		if (acutalmsg == null) {
			Assert.assertEquals(msg, "");
		} else {
			Assert.assertEquals(msg, acutalmsg);
		}
	}
	
	//TrangLT  	
    @Then("^error message \"([^\"]*)\" should be display under Style fields$")
    public void error_message_something_should_be_display_under_style_fields(String msg) throws Throwable {
		String acutalmsg = dmdvConfigurationSteps.get_error_message_under_style();
		Assert.assertEquals(msg, acutalmsg);
    }
    
    @Then("^error message \"([^\"]*)\" should be display under Backgroundcolors fields$")
    public void error_message_something_should_be_display_under_backgroundcolors_fields(String msg) throws Throwable {
		String acutalmsg = dmdvConfigurationSteps.get_error_message_under_style();
		Assert.assertEquals(msg, acutalmsg);
		dmdvConfigurationSteps.select_delete_icon_background();
		dmdvConfigurationSteps.click_save_button();
    }

    @Then("^error message \"([^\"]*)\" should be display under Labelcolors fields$")
    public void error_message_something_should_be_display_under_labelcolors_fields(String msg) throws Throwable {
		String acutalmsg = dmdvConfigurationSteps.get_error_message_under_style();
		Assert.assertEquals(msg, acutalmsg);
		dmdvConfigurationSteps.select_delete_icon_label();
		dmdvConfigurationSteps.click_save_button();
    }
    
    @Then("^error message \"([^\"]*)\" should be display under Bordercolors fields$")
    public void error_message_something_should_be_display_under_bordercolors_fields(String msg) throws Throwable {
		String acutalmsg = dmdvConfigurationSteps.get_error_message_under_style();
		Assert.assertEquals(msg, acutalmsg);
		dmdvConfigurationSteps.select_delete_icon_border();
		dmdvConfigurationSteps.click_save_button();
    }

    @Then("^error message \"([^\"]*)\" should be display under Borderstyles fields$")
    public void error_message_something_should_be_display_under_borderstyles_fields(String msg) throws Throwable {
		String acutalmsg = dmdvConfigurationSteps.get_error_message_under_style();
		if (acutalmsg == null) {
			acutalmsg = "";
		}
		Assert.assertEquals(msg, acutalmsg);
		dmdvConfigurationSteps.select_delete_icon_border_style();
		dmdvConfigurationSteps.click_save_button();
    }
    
    @Then("^error message \"([^\"]*)\" should be display under Borderwidths fields$")
    public void error_message_something_should_be_display_under_borderwidths_fields(String msg) throws Throwable {
		String acutalmsg = dmdvConfigurationSteps.get_error_message_under_style();
		Assert.assertEquals(msg, acutalmsg);
		dmdvConfigurationSteps.select_delete_icon_border_width();
		dmdvConfigurationSteps.click_save_button();
    }
    
    @Then("^error message \"([^\"]*)\" should be display on pop-up$")
    public void error_message_something_should_be_display_on_popup(String msgP) throws Throwable {
		String acutalmsgP = dmdvConfigurationSteps.get_text_popup_message();
		Assert.assertEquals(msgP, acutalmsgP);
    }
    
	@And("^input \"([^\"]*)\" to Conditional Filter text box$")
	public void input_something_to_conditional_filter_text_box(String text) throws Throwable {
		dmdvConfigurationSteps.input_to_conditional_filter_text_box(text);
		dmdvConfigurationSteps.click_save_button();
	}
//
	@And("^click save button$")
	public void click_save_button() throws Throwable {
		dmdvConfigurationSteps.click_save_button();
	}

	@Given("^open table configuration with configuration name \"([^\"]*)\" and table name \"([^\"]*)\"$")
	public void open_table_configuration_with_configuration_name_something_and_table_name_something(String strArg1,
			String strArg2) throws Throwable {
		dmdvConfigurationSteps.open_table_configuration_page(strArg1, strArg2);
	}

	//TrangLT
	
    @And("^input \"([^\"]*)\" to Styles Default on Node Style$")
    public void input_something_to_styles_default_on_node_style(String style) throws Throwable {
    	dmdvConfigurationSteps.click_node_style();
    	dmdvConfigurationSteps.input_to_color_styles_default(style);
		dmdvConfigurationSteps.click_outside();
    }

    @And("^only input Border Width \"([^\"]*)\" to Styles Default on Node Style$")
    public void only_input_border_width_something_to_styles_default_on_node_style(String value) throws Throwable {
    	dmdvConfigurationSteps.click_node_style();
    	dmdvConfigurationSteps.input_to_border_width_default(value);
		dmdvConfigurationSteps.click_outside();
    }
    
    @And("^only input Border Style \"([^\"]*)\" to Styles Default on Node Style$")
    public void only_input_border_style_something_to_styles_default_on_node_style(String value) throws Throwable {
    	dmdvConfigurationSteps.click_node_style();
    	dmdvConfigurationSteps.input_to_border_style_default(value);
		dmdvConfigurationSteps.click_outside();
    }
	
    @Then("^verify \"([^\"]*)\" when was saved$")
    public void verify_something_when_was_saved(String value) throws Throwable {
		dmdvConfigurationSteps.click_save_button();
		String acutalvalue = dmdvConfigurationSteps.get_value_border_style(value);
		Assert.assertEquals(value, acutalvalue);
    }

    @Then("^verify displays \"([^\"]*)\" when was saved$")
    public void verify_displays_something_when_was_saved(String value) throws Throwable {
		dmdvConfigurationSteps.click_save_button();
		String acutalvalue = dmdvConfigurationSteps.get_value_border_width();
		Assert.assertEquals(value, acutalvalue);
    }
    
    @Then("^verify display \"([^\"]*)\" when was saved$")
    public void verify_display_something_when_was_saved(String value) throws Throwable {
		dmdvConfigurationSteps.click_save_button();
		String acutalvalue = dmdvConfigurationSteps.get_value_border_color_styles_default();
		Assert.assertEquals("#"+ value, acutalvalue);
		String acutalvalue1 = dmdvConfigurationSteps.get_value_background_color_styles_default();
		Assert.assertEquals("#"+ value, acutalvalue1);
		String acutalvalue2 = dmdvConfigurationSteps.get_value_label_color_styles_default();
		Assert.assertEquals("#"+ value, acutalvalue2);
    }
    
    @And("^input color style by Color picker$")
    public void input_color_style_by_color_picker() throws Throwable {
    	dmdvConfigurationSteps.click_node_style();
    	dmdvConfigurationSteps.input_color_style_by_color_picker();
		dmdvConfigurationSteps.click_outside();
    }    
    
    @And("^input \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" for Background Color$")
    public void input_something_and_something_and_something_for_background_color(String labelinlegend, String color, String condition) throws Throwable {
    	dmdvConfigurationSteps.click_node_style();
    	dmdvConfigurationSteps.input_for_background_color(labelinlegend, color, condition);
    }
    
//    @And("^input \"([^\"]*)\" for Background Color$")
//    public void input_something_for_background_color(String labelinlegend) throws Throwable {
//    	dmdvConfigurationSteps.click_node_style();
//    	dmdvConfigurationSteps.input_for_background_colorx(labelinlegend);
//    }
    
    @And("^input \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" for Label Color$")
    public void input_something_and_something_and_something_for_label_color(String labelinlegend, String color, String condition) throws Throwable {
    	dmdvConfigurationSteps.click_node_style();
    	dmdvConfigurationSteps.input_for_label_color(labelinlegend, color, condition);
    }
    
    @And("^input \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" for Border Color$")
    public void input_something_and_something_and_something_for_border_color(String labelinlegend, String color, String condition) throws Throwable {
    	dmdvConfigurationSteps.click_node_style();
    	dmdvConfigurationSteps.input_for_border_color(labelinlegend, color, condition);
    }

    @And("^input \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" for Border Style$")
    public void input_something_and_something_and_something_for_border_style(String labelinlegend, String style, String condition) throws Throwable {
    	dmdvConfigurationSteps.click_node_style();
    	dmdvConfigurationSteps.input_for_border_style(labelinlegend, style, condition);
    }
    
    @And("^input \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" for Border Width$")
    public void input_something_and_something_and_something_for_border_width(String labelinlegend, String width, String condition) throws Throwable {
    	dmdvConfigurationSteps.click_node_style();
    	dmdvConfigurationSteps.input_for_border_width(labelinlegend, width, condition);
    }
    
    @Then("^verify \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" for Background Color when were saved$")
    public void verify_something_and_something_and_something_for_background_color_when_were_saved(String labelinlegendExp, String colorExp, String conditionExp) throws Throwable {
		String acutalvalue = dmdvConfigurationSteps.get_value_labelinlegend_background();
		Assert.assertEquals(labelinlegendExp, acutalvalue);
		String acutalvalue1 = dmdvConfigurationSteps.get_value_color_background();
		Assert.assertEquals("#"+ colorExp, acutalvalue1);
		String acutalvalue2 = dmdvConfigurationSteps.get_value_condition_background();
		Assert.assertEquals(conditionExp, acutalvalue2);
		dmdvConfigurationSteps.select_delete_icon_background();
		dmdvConfigurationSteps.click_save_button();
    }
    
    @Then("^verify \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" for Label Color when were saved$")
    public void verify_something_and_something_and_something_for_label_color_when_were_saved(String labelinlegendExp, String colorExp, String conditionExp) throws Throwable {
		String acutalvalue = dmdvConfigurationSteps.get_value_labelinlegend_label();
		Assert.assertEquals(labelinlegendExp, acutalvalue);
		String acutalvalue1 = dmdvConfigurationSteps.get_value_color_label();
		Assert.assertEquals("#"+ colorExp, acutalvalue1);
		String acutalvalue2 = dmdvConfigurationSteps.get_value_condition_label();
		Assert.assertEquals(conditionExp, acutalvalue2);
		dmdvConfigurationSteps.select_delete_icon_label();
		dmdvConfigurationSteps.click_save_button();
    }

    @Then("^verify \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" for Border Color when were saved$")
    public void verify_something_and_something_and_something_for_border_color_when_were_saved(String labelinlegendExp, String colorExp, String conditionExp) throws Throwable {
		String acutalvalue = dmdvConfigurationSteps.get_value_labelinlegend_border();
		Assert.assertEquals(labelinlegendExp, acutalvalue);
		String acutalvalue1 = dmdvConfigurationSteps.get_value_color_border();
		Assert.assertEquals("#"+ colorExp, acutalvalue1);
		String acutalvalue2 = dmdvConfigurationSteps.get_value_condition_border();
		Assert.assertEquals(conditionExp, acutalvalue2);
		dmdvConfigurationSteps.select_delete_icon_border();
		dmdvConfigurationSteps.click_save_button();
    }
  
    @Then("^verify \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" for Border Style when were saved$")
    public void verify_something_and_something_and_something_for_border_style_when_were_saved(String labelinlegendExp, String styleExp, String conditionExp) throws Throwable {
		String acutalvalue = dmdvConfigurationSteps.get_value_labelinlegend_border_style();
		Assert.assertEquals(labelinlegendExp, acutalvalue);
		String acutalvalue1 = dmdvConfigurationSteps.get_value_style_border_style();
		Assert.assertEquals(styleExp, acutalvalue1);
		String acutalvalue2 = dmdvConfigurationSteps.get_value_condition_border_style();
		Assert.assertEquals(conditionExp, acutalvalue2);
		dmdvConfigurationSteps.select_delete_icon_border_style();
		dmdvConfigurationSteps.click_save_button();
    }
    
    @Then("^verify \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" for Border Width when were saved$")
    public void verify_something_and_something_and_something_for_border_width_when_were_saved(String labelinlegendExp, String widthExp, String conditionExp) throws Throwable {
		String acutalvalue = dmdvConfigurationSteps.get_value_labelinlegend_border_width();
		Assert.assertEquals(labelinlegendExp, acutalvalue);
		String acutalvalue1 = dmdvConfigurationSteps.get_value_color_border_width();
		Assert.assertEquals(widthExp, acutalvalue1);
		String acutalvalue2 = dmdvConfigurationSteps.get_value_condition_border_width();
		Assert.assertEquals(conditionExp, acutalvalue2);
		dmdvConfigurationSteps.select_delete_icon_border_width();
		dmdvConfigurationSteps.click_save_button();
    }
    
    @And("^error message shouldn't be display under fields$")
    public void error_message_shouldnt_be_display_under_fields() throws Throwable {
		String acutalmsg = dmdvConfigurationSteps.get_error_message();
		Assert.assertEquals(null, acutalmsg);
   }
    
    //
	// MuaBT add/

	@Given("^open Default label wizard list$")
	public void open_default_label_wizard_list() throws Throwable {
		dmdvConfigurationSteps.click_pen_icon_default();
		dmdvConfigurationSteps.click_wizard_icon_default();
		dmdvConfigurationSteps.click_arrow_icon_default();
	}

	@Given("^open Default label wizard list of link$")
	public void open_default_label_wizard_list_of_link() throws Throwable {
		dmdvConfigurationSteps.click_wizard_icon_default();
		dmdvConfigurationSteps.click_arrow_icon_default_link();
	}

	@Given("^open Localize label wizard list$")
	public void open_localize_label_wizard_list() throws Throwable {
		dmdvConfigurationSteps.click_wizard_icon_localize();
		dmdvConfigurationSteps.click_arrow_icon_localize();
	}

	@Given("^open Localize label wizard list of link$")
	public void open_localize_label_wizard_list_of_link() throws Throwable {
		dmdvConfigurationSteps.click_wizard_icon_localize_link();
		dmdvConfigurationSteps.click_arrow_icon_localize_link();
	}

	@Then("^verify list field of table in Default label ensure not include association and selection node$")
	public void verify_list_field_of_table_in_default_label_ensure_not_include_association_and_selection_node(
			List<String> excludeFields) throws Throwable {
		List<String> listField = dmdvConfigurationSteps.getListField();
		for (String field : listField) {
			for (String excludeField : excludeFields) {
				if (field.equals(excludeField)) {
					Assert.assertFalse("The field " + excludeField + " is existed on field list", true);
				}
			}
		}
	}

	@Then("^verify list field of table in Localize label ensure not include association and selection node$")
	public void verify_list_field_of_table_in_localize_label_ensure_not_include_association_and_selection_node(
			List<String> excludeFields) throws Throwable {
		List<String> listField = dmdvConfigurationSteps.getListFieldLocalized();
		for (String field : listField) {
			for (String excludeField : excludeFields) {
				if (field.equals(excludeField)) {
					Assert.assertFalse("The field " + excludeField + " is existed on field list", true);
				}
			}
		}
	}

	@Given("^open saved graph page$")
	public void open_saved_graph_page() throws Throwable {
		dmdvConfigurationSteps.open_savedgraph_page();
	}

	@Then("^verify saved graph with \"([^\"]*)\" and user profile \"([^\"]*)\"$")
	public void verify_saved_graph_with_something_and_user_profile_something(String graphName, String user)
			throws Throwable {
		if (user == null || user.isEmpty()) {
			return;
		}
		dmdvConfigurationSteps.searchSavedGraphByNameAndUser(graphName, user);
		dmdvConfigurationSteps.verify_saved_graph_with_something_and_user_profile_something(graphName, user);
	}

	@Then("^verify saved graph with \"([^\"]*)\" and user \"([^\"]*)\"$")
	public void verify_saved_graph_with_something_and_user_something(String graphName, String userName) throws Throwable {
		if (userName == null || userName.isEmpty()) {
			return;
		}
		dmdvConfigurationSteps.searchSavedGraphByNameAndUser(graphName, userName);
		dmdvConfigurationSteps.verify_saved_graph_with_something_and_user_something(graphName, userName);
	}

	@Then("^delete saved graph with \"([^\"]*)\" and user profile \"([^\"]*)\"$")
	public void delete_saved_graph_with_something_and_user_profile_something(String graphname, String user)
			throws Throwable {
		if (user == null || user.isEmpty()) {
			return;
		}
		dmdvConfigurationSteps.delete_saved_graph_with_something_and_user_profile_something(graphname, user);

	}
	
    @Then("^delete saved graph with \"([^\"]*)\" and user \"([^\"]*)\"$")
	public void delete_saved_graph_with_something_and_user_something(String graphname, String userName)
			throws Throwable {
		if (userName == null || userName.isEmpty()) {
			return;
		}
		dmdvConfigurationSteps.delete_saved_graph_with_something_and_user_something(graphname, userName);
	}
    
   }
