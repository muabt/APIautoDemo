package com.orchestranetworks.auto.addon;

import org.junit.runner.RunWith;

import cucumber.api.CucumberOptions;
import net.serenitybdd.cucumber.CucumberWithSerenity;

@RunWith(CucumberWithSerenity.class)
@CucumberOptions(features = "src/test/resources/features/", tags = { "@Survivor_record_selection_mode" })
public class DefinitionTestSuite {

}
