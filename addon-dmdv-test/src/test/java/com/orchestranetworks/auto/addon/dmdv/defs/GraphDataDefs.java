package com.orchestranetworks.auto.addon.dmdv.defs;

import java.util.List;

import com.orchestranetworks.auto.addon.dmdv.steps.GraphDataSteps;
import com.orchestranetworks.auto.addon.dmdv.steps.GraphViewSteps;

import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.thucydides.core.annotations.Steps;

public class GraphDataDefs {
	@Steps
	GraphDataSteps graphDataSteps;
	@Steps
	GraphViewSteps onGraphViewSteps;
	
	@Then("^the label of node \"([^\"]*)\" equal \"([^\"]*)\"$")
    public void the_label_of_node_something_equal_something(String nodeKey, String label) throws Throwable {
    	graphDataSteps.verifyNodeLabel(nodeKey, label);
    }
	// MuaBT add
    @Then("^the label of link from node \"([^\"]*)\" to \"([^\"]*)\" equal \"([^\"]*)\"$")
    public void the_label_of_link_from_node_something_to_something_equal_something(String fromNode, String toNode, String label) throws Throwable {
    	graphDataSteps.verifyLinklabel(fromNode, toNode, label);	
    }
    //************************
    @When("^user expands source on node \"([^\"]*)\"$")
    public void user_expands_source_on_node_something(String selectedNode) throws Throwable {
    	onGraphViewSteps.expandSource(selectedNode);
    }

    @When("^user expands target on node \"([^\"]*)\"$")
    public void user_expands_target_on_node_something(String nodeKey) throws Throwable {
    	onGraphViewSteps.expandTarget(nodeKey);
    }

    @When("^user expands parent on node \"([^\"]*)\"$")
    public void user_expands_parent_on_node_something(String nodeKey) throws Throwable {
    	onGraphViewSteps.expandParent(nodeKey);
    }    
    
    @When("^user expands children on node \"([^\"]*)\"$")
    public void user_expands_children_on_node_something(String nodeKey) throws Throwable {
    	onGraphViewSteps.expandChild(nodeKey);
    }
    
    @Then("^the label of all nodes is displayed as following$")
    public void the_label_of_all_nodes_is_displayed_as_following(List<List<String>> expected) throws Throwable {
    	graphDataSteps.verifyAllNodes(expected);
    }
    
    @Then("^the label of link label should be display as following$")
    public void the_label_of_link_label_should_be_display_as_following(List<List<String>> exptectedLinks) throws Throwable {
    	graphDataSteps.verifyAllLinks(exptectedLinks);
    }
    
    @Then("^there is no link displayed$")
    public void there_is_no_link_displayed() throws Throwable {
    	graphDataSteps.verifyNoLinks();
    }
    
    @Then("^current graph orientation should be \"([^\"]*)\"$")
    public void current_graph_orientation_should_be_something(String expectedOrientation) throws Throwable {
    	graphDataSteps.verifyCurrentOrientation(expectedOrientation);
    }
    
    @When("^user change graph orientation to \"([^\"]*)\"$")
    public void user_change_graph_orientation_to_something(String newOrientation) throws Throwable {
    	graphDataSteps.changeOrientation(newOrientation);
    }
    //MuaBT add
    @When("^user collapse target on node \"([^\"]*)\"$")
    public void user_collapse_target_on_node_something(String nodeKey) throws Throwable {
    	onGraphViewSteps.collapseTarget(nodeKey);
    }
    
    @When("^user collapse source on node \"([^\"]*)\"$")
    public void user_collapse_source_on_node_something(String nodeKey) throws Throwable {
    	onGraphViewSteps.collapseSource(nodeKey);
    }
    
    @When("^user collapse children on node \"([^\"]*)\"$")
    public void user_collapse_children_on_node_something(String nodeKey) throws Throwable {
    	onGraphViewSteps.collapseChild(nodeKey);
    }
    
    @When("^user collapse parent on node \"([^\"]*)\"$")
    public void user_collapse_parent_on_node_something(String nodeKey) throws Throwable {
    	onGraphViewSteps.collapseParent(nodeKey);
    }
    //*****************
    
    @When("^user expands source recursively on node \"([^\"]*)\"$")
    public void user_expands_source_recursively_on_node_something(String nodeKey) throws Throwable {
    	onGraphViewSteps.expandSourceRecursively(nodeKey);
    }
    @When("^user expands target recursively on node \"([^\"]*)\"$")
    public void user_expands_target_recursively_on_node_something(String nodeKey) throws Throwable {
    	onGraphViewSteps.expandTargetRecursively(nodeKey);
    }
    @When("^user collapse source recursively on node \"([^\"]*)\"$")
    public void user_collapse_source_recursively_on_node_something(String nodeKey) throws Throwable {
    	onGraphViewSteps.collapseSourceRecursively(nodeKey);
    }
    @When("^user collapse target recursively on node \"([^\"]*)\"$")
    public void user_collapse_target_recursively_on_node_something(String nodeKey) throws Throwable {
    	onGraphViewSteps.collapseTargetRecursively(nodeKey);
    }
    @When("^user expands parent recursively on node \"([^\"]*)\"$")
    public void user_expands_parent_recursively_on_node_something(String nodeKey) throws Throwable {
    	onGraphViewSteps.expandParentRecursively(nodeKey);
    }
    @When("^user expands children recursively on node \"([^\"]*)\"$")
    public void user_expands_children_recursively_on_node_something(String nodeKey) throws Throwable {
    	onGraphViewSteps.expandChildRecursively(nodeKey);
    }
    @When("^user collapse children recursively on node \"([^\"]*)\"$")
    public void user_collapse_children_recursively_on_node_something(String nodeKey) throws Throwable {
    	onGraphViewSteps.collapseChildRecursively(nodeKey);
    }
    @When("^user collapse parent recursively on node \"([^\"]*)\"$")
    public void user_collapse_parent_recursively_on_node_something(String nodeKey) throws Throwable {
    	onGraphViewSteps.collapseParentRecursively(nodeKey);
    }
}
