package com.orchestranetworks.auto.addon.steps;

import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.SessionData;
import com.orchestranetworks.auto.addon.pages.CommonPage;
import com.orchestranetworks.auto.addon.pages.DataspaceBriefInfoPage;
import com.orchestranetworks.auto.addon.pages.DataspaceCreationPage;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.annotations.Steps;
import net.thucydides.core.steps.ScenarioSteps;

import static org.assertj.core.api.Assertions.assertThat;


import java.util.ArrayList;
import java.util.List;

public class DataspaceSteps extends ScenarioSteps {
    DataspaceBriefInfoPage onDataspaceBriefInfoPage;
    DataspaceCreationPage onDataspaceCreationPage;

    @Step
    public void click_btn_create_dataspace() {
        onDataspaceBriefInfoPage.getToolbarWidget().clickBtnCreateDataspace();
    }

    @Step
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

    @Step
    public void click_btn_create() {
        onDataspaceCreationPage.getFooterWidget().clickBtnCreate();
        SessionData.saveValueToSession(Constants.DATASPACE_IDENTIFIER, onDataspaceBriefInfoPage.getDataspaceBriefInforWidget().getTextIdentifier());
    }

    @Step
    public void click_dataspace_actions() {
        onDataspaceBriefInfoPage.getToolbarWidget().clickBtnActions();
    }

    @Step
    public void select_dataspace_service(String servicePath) {
        onDataspaceBriefInfoPage.getToolbarWidget().selectService(servicePath);
    }

    @Step
    public void verify_dataspace(List<String> info) {
        List<String> actualInfor = new ArrayList<String>();
        String id = onDataspaceBriefInfoPage.getDataspaceBriefInforWidget().getTextIdentifier();
        SessionData.saveValueToSession(Constants.DATASPACE_IDENTIFIER, id);
        if (!info.get(0).isEmpty()) {
            actualInfor.add(id);
        } else {
            actualInfor.add("");
        }
        actualInfor.add(onDataspaceBriefInfoPage.getDataspaceBriefInforWidget().getTextType());
        actualInfor.add(onDataspaceBriefInfoPage.getDataspaceBriefInforWidget().getTextOwner());
        actualInfor.add(onDataspaceBriefInfoPage.getDataspaceBriefInforWidget().getTextStatus());
        actualInfor.add(onDataspaceBriefInfoPage.getDataspaceBriefInforWidget().getTextLoadingStrategy());
        actualInfor.add(onDataspaceBriefInfoPage.getDataspaceBriefInforWidget().getTextChildMergePolicy());

        assertThat(actualInfor).isEqualTo(info);
    }

    @Step
    public void close_dataspace() {
        onDataspaceBriefInfoPage.getToolbarWidget().clickBtnActions().selectService("Close this dataspace");
        onDataspaceBriefInfoPage.getPopupWidget().confirmOK();
    }

    @Step
    public boolean is_dataspace_exist(String dataspace) {
        onDataspaceBriefInfoPage.getNavPanel().expandAllNavigationItems();
        return onDataspaceBriefInfoPage.getNavPanel().isNavigationItemExist(dataspace);

    }

    @Step
    public void delete_dataspace_by_service() {
        onDataspaceBriefInfoPage.getDataspaceBriefInforWidget().deleteDataspaceByService();
    }
}
