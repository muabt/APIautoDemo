package com.orchestranetworks.auto.addon.steps;

import com.orchestranetworks.auto.addon.pages.DataspaceBriefInfoPage;
import net.thucydides.core.steps.ScenarioSteps;

public class DataspaceSteps extends ScenarioSteps {
    DataspaceBriefInfoPage onDataspaceBriefInfoPage;
    public void create_dataspace(String dataspaceName){

        onDataspaceBriefInfoPage.getDataspaceBriefInforWidget();
    }
}
