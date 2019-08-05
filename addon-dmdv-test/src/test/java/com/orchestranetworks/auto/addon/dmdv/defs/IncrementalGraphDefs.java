package com.orchestranetworks.auto.addon.dmdv.defs;

import java.util.List;

import com.orchestranetworks.auto.addon.dmdv.steps.IncrementalGraphSteps;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;

public class IncrementalGraphDefs {
	
	@Steps
	IncrementalGraphSteps onIncrementalGraphSteps;

    @Then("^the incremental graph should be displayed$")
    public void the_incremental_graph_should_be_displayed() throws Throwable {
    	onIncrementalGraphSteps.verifyIncrementalGraphDisplayed();
    }
    
    @Then("^the graph should contains following nodes$")
    public void the_graph_should_contains_following_nodes(List<List<String>> expected) throws Throwable {
    	onIncrementalGraphSteps.verifyNodesDisplayed(expected);
    }
    
    @Then("^the graph should not contains any link$")
    public void the_graph_should_not_contains_any_link() throws Throwable {
    	onIncrementalGraphSteps.verifyGraphHasNoLink();
    }
    
    @Then("^the graph should contains following links$")
    public void the_graph_should_contains_following_links(List<List<String>> expected) throws Throwable {
    	onIncrementalGraphSteps.verifyLinksDisplayed(expected);
    }
    
    @When("^user expands on node \"([^\"]*)\"$")
    public void user_expands_on_node_something(String nodeKey) throws Throwable {
    	onIncrementalGraphSteps.expandNode(nodeKey);
    }
    
    @When("^user collapses on node \"([^\"]*)\"$")
    public void user_collapses_on_node_something(String nodeKey) throws Throwable {
    	onIncrementalGraphSteps.collapseNode(nodeKey);
    }
    
    @Then("^in the displayed incremental graph the label of node \"([^\"]*)\" equal \"([^\"]*)\"$")
    public void in_the_displayed_incremental_graph_the_label_of_node_something_equal_something(String nodeKey, String nodeLabel) throws Throwable {
    	onIncrementalGraphSteps.verifyNodeDisplayed(nodeKey, nodeLabel);
    }

}
