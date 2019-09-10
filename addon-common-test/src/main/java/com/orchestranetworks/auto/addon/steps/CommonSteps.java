package com.orchestranetworks.auto.addon.steps;


import com.google.common.base.Joiner;
import com.orchestranetworks.auto.addon.pages.CommonPage;

import junit.framework.Assert;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.steps.ScenarioSteps;

public class CommonSteps extends ScenarioSteps {

    CommonPage onCommonPage;

    @Step
    public void access_login_page() {
        onCommonPage.access_login_page();
    }

    @Step
    public void login_to_system(String userName, String password) {
        onCommonPage.getLogin().enterUsername(userName);
        onCommonPage.getLogin().enterPassword(password);
        onCommonPage.getLogin().clickBtnLogin();
    }

    @Step
    public void verify_login_success() {
        Assert.assertTrue(is_login_success());
    }


    @Step
    public void click_btn_logout() {
        onCommonPage.getUserCard().clickBtnLogout();
    }

    @Step
    public void access_menu(String menu) {
        onCommonPage.getHeader().accessMenu(menu);
    }

    @Step
    public void open_user_panel() {
        onCommonPage.getHeader().openUserPanel();
    }

    @Step
    public void change_language(String name) {
        onCommonPage.getUserCard().changeLanguage(name);
    }

    @Step
    public void change_perspective(String perName) {
        onCommonPage.getHeader().clickBtnSelectPerspective();
        onCommonPage.getHeader().selectPerspective(perName);
    }

    @Step
    public void navigate_to_perspective_action(String path) {
    }

    @Step
    public boolean is_login_success() {
        return onCommonPage.getHeader().isHeaderExist();
    }
    public void remove_choose_dataset_div(){
        onCommonPage.getHeader().removeChooseDatasetDiv();
    }


    @Step
    public void go_to_dataspace(String path) {
        go_to_path(path);
    }

    @Step
    public void go_to_data_set(String path) {
        go_to_path(path);
    }

    private void go_to_path(String path) {
        String[] itemList = path.split(">");
        onCommonPage.getNavPanel().collapseNavigationItems();
        for (int i = 0; i < itemList.length - 1; i++) {
            onCommonPage.getNavPanel().expandNavigationItem(itemList[i].trim());
            waitABit(2000);
        }
        onCommonPage.getNavPanel().accessNavigationItem(itemList[itemList.length - 1].trim());
    }

    @Step
    public void click_on_table_name(String tblName) {
        onCommonPage.getNavPanel().accessNavigationItem(tblName);
    }
}
