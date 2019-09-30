package com.orchestranetworks.auto.addon.steps;

import static com.orchestranetworks.auto.addon.Constants.IFRAME_LEGACY;
import static org.assertj.core.api.Assertions.assertThat;

import com.orchestranetworks.auto.addon.pages.CommonPage;

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
        assertThat(is_login_success()).isEqualTo(true);
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

    @Step
    public void go_to_dataspace(String path) {
        onCommonPage.getNavPanel().changeDataspace();
        onCommonPage.getNavPanel().goToPath(path);
    }

    @Step
    public void go_to_dataset(String path) {
        onCommonPage.getNavPanel().changeDataset();
        onCommonPage.getNavPanel().goToPath(path);
    }

    @Step
    public void go_to_administration_item(String path) {
        onCommonPage.getNavPanel().selectAdministrationFeature();
        onCommonPage.getNavPanel().goToPath(path);
    }


    @Step
    public void click_on_table_name(String tblName) {
        onCommonPage.getNavPanel().accessNavigationItem(tblName);
        onCommonPage.switchToIFrame(IFRAME_LEGACY);
    }

    @Step
    public void click_btn_submit() {
        onCommonPage.getFooter().clickBtnSubmit();
    }

    @Step
    public void confirmPopupOk() {
        onCommonPage.getPopupWidget().confirmOK();
    }

    @Step
    public void click_btn_filter() {
        onCommonPage.getToolbar().clickBtnFilter();
    }

    @Step
    public void select_criteria_with_label(String criterion) {
        onCommonPage.getAdvanceSearch().selectSearchCriteria(criterion);
    }

    @Step
    public void select_operator_of_field(String oper, String field) {
        onCommonPage.getAdvanceSearch().selectOperatorOfField(oper, field);
    }

    @Step
    public void input_search_value(String value, String type, String field) {
        onCommonPage.getAdvanceSearch().inputSearchValue(value, type, field);
    }

    @Step
    public void click_btn_apply_search() {
        onCommonPage.getAdvanceSearch().clickApply(1);
    }

    @Step
    public void click_btn_expand_with_label(String textSearch) {
        onCommonPage.getAdvanceSearch().clickBtnExpand(textSearch);
    }

    @Step
    public void unselect_field_with_label(String field) {
        onCommonPage.getAdvanceSearch().unselectField(field);
    }

    @Step
    public void click_btn_apply_text_search() {
        onCommonPage.getAdvanceSearch().clickApply(1);
    }

    @Step
    public void input_text_keyword(String fieldContains) {
        onCommonPage.getAdvanceSearch().inputTextKeyword(fieldContains);
    }

    @Step
    public void select_search_item(String textSearch, String item) {
        onCommonPage.getAdvanceSearch().selectField(textSearch, item);
    }

    @Step
    public void input_validation_keyword(String msgContains) {
        onCommonPage.getAdvanceSearch().inputValidationKeyword(msgContains);
    }

    @Step
    public void click_btn_apply_validation_search() {
        onCommonPage.getAdvanceSearch().clickApply(3);
    }

    @Step
    public void select_advanced_mode() {
        onCommonPage.getAdvanceSearch().selectAdvancedMode();
    }

    @Step
    public void select_logical_search(String logical) {
        onCommonPage.getAdvanceSearch().selectLogicalSearch(logical);
    }

    public void input_fuzzy_keyword(String recordContains) {
        onCommonPage.getAdvanceSearch().inputFuzzyKeyword(recordContains);
    }

    public void click_btn_apply_fuzzy_search() {
        onCommonPage.getAdvanceSearch().clickApply(4);
    }
}
