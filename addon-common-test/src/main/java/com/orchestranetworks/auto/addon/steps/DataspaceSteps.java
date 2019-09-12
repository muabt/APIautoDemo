package com.orchestranetworks.auto.addon.steps;

import com.orchestranetworks.auto.addon.pages.DataspaceBriefInfoPage;
import com.orchestranetworks.auto.addon.pages.DataspaceCreationPage;
import net.thucydides.core.steps.ScenarioSteps;

import static org.assertj.core.api.Assertions.assertThat;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
            onDataspaceCreationPage.getDataspaceCreationWidget().selectOwner(owner);
        }
        if (!engLabel.isEmpty()) {
            onDataspaceCreationPage.getDataspaceCreationWidget().enterEnglishLabel(engLabel);
        }
    }

    public void click_btn_create() {
        onDataspaceCreationPage.getFooterWidget().clickBtnCreate();
    }

    public void click_dataspace_actions() {
        onDataspaceBriefInfoPage.getToolbarWidget().clickBtnActions();
    }

    public void select_dataspace_service(String servicePath) {
        onDataspaceBriefInfoPage.getToolbarWidget().selectService(servicePath);
    }

    public void verify_dataspace(List<String> info) {
        List<String> actualInfor = new ArrayList<String>();
        actualInfor.add(onDataspaceBriefInfoPage.getDataspaceBriefInforWidget().getTextIdentifier());
        actualInfor.add(onDataspaceBriefInfoPage.getDataspaceBriefInforWidget().getTextType());
        actualInfor.add(onDataspaceBriefInfoPage.getDataspaceBriefInforWidget().getTextOwner());
        actualInfor.add(onDataspaceBriefInfoPage.getDataspaceBriefInforWidget().getTextStatus());
        actualInfor.add(onDataspaceBriefInfoPage.getDataspaceBriefInforWidget().getTextLoadingStrategy());
        actualInfor.add(onDataspaceBriefInfoPage.getDataspaceBriefInforWidget().getTextChildMergePolicy());

        assertThat(actualInfor).isEqualTo(info);
    }
}
