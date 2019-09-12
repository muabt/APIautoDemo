package com.orchestranetworks.auto.addon.steps;

import com.orchestranetworks.auto.addon.pages.DataspaceBriefInfoPage;
import com.orchestranetworks.auto.addon.pages.DataspaceCreationPage;
import net.thucydides.core.steps.ScenarioSteps;

public class DataspaceSteps extends ScenarioSteps {
    DataspaceBriefInfoPage onDataspaceBriefInfoPage;
    DataspaceCreationPage onDataspaceCreationPage;

    public void click_btn_create_dataspace() {
        onDataspaceBriefInfoPage.getToolbarWidget().clickBtnCreateDataspace();
    }

    public void enter_dataspace_info(String identifier, String owner, String engLabel) {
        if (!identifier.isEmpty()) {
            onDataspaceCreationPage.getDataspaceCreationWidget().enterIdentifier(identifier);
        }
        if (!owner.isEmpty()) {
            onDataspaceCreationPage.getDataspaceCreationWidget().enterOwner(owner);
        }
        if (!engLabel.isEmpty()) {
            onDataspaceCreationPage.getDataspaceCreationWidget().enterEnglishLabel(engLabel);

        }
    }

    public void click_btn_create() {
        onDataspaceCreationPage.getFooterWidget().clickBtnCreate();
    }
}
