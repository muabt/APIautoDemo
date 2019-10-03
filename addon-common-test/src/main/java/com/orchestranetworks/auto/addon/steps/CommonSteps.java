package com.orchestranetworks.auto.addon.steps;

import static com.orchestranetworks.auto.addon.utils.Constants.IFRAME_LEGACY;
import static org.assertj.core.api.Assertions.assertThat;

import com.orchestranetworks.auto.addon.utils.Constants;
import com.orchestranetworks.auto.addon.pages.CommonPage;

import net.thucydides.core.annotations.Step;
import net.thucydides.core.steps.ScenarioSteps;

import java.util.List;
import java.util.Map;

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
    public void confirm_popup_OK() {
        onCommonPage.getPopupWidget().confirmOK();
    }

    @Step
    public void click_btn_filter() {
        onCommonPage.getToolbar().clickBtnFilter();
    }

    @Step
    public void click_btn_expand_of_search_type(String searchType) {
        onCommonPage.getTextSearch().clickBtnExpandWithLabel(searchType);
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
    public void click_btn_apply_advanced_search() {
        onCommonPage.getAdvanceSearch().clickApplyAdvancedSearch();
        onCommonPage.getToolbar().clickBtnFilter();
    }

    @Step
    public void text_search_with_field(String text) {
        onCommonPage.getTextSearch().inputTextKeyword(text);
        onCommonPage.getTextSearch().unselectField(Constants.SELECT_ALL);
        String[] pkList = {"Data model", "Table"};
        for (int i = 0; i < pkList.length; i++) {
            onCommonPage.getTextSearch().selectField(Constants.TEXT_SEARCH, pkList[i]);
        }
        onCommonPage.getTextSearch().clickApplyTextSearch();
    }

    @Step
    public void click_btn_expand_with_label(String searchType) {
        onCommonPage.getAdvanceSearch().clickBtnExpandWithLabel(searchType);
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

    public void click_btn_save_and_close() {
        onCommonPage.getFooter().clickBtnSaveAndClose();
    }

    public void select_service_add_logical_block() {
        onCommonPage.getAdvanceSearch().addLogicalBlock();
    }

    public void click_btn_add_logical_block() {
        onCommonPage.getAdvanceSearch().clickBtnAddBlock();
    }

    public void verify_table_noRecordsFound() {
        assertThat(onCommonPage.getDefaultViewWidget().isRecordInTableExisted()).isEqualTo(false);
    }

    public void search_with_advance_search(String logical, List<Map<String, String>> condition) {
        click_btn_filter();
        select_advanced_mode();
        select_logical_search(logical);

        for (Map<String, String> row : condition) {
            String criterion = row.get("Criterion");
            String oper = row.get("Operation");
            String value = row.get("Value");
            String type = row.get("Field type");

            select_criteria_with_label(criterion);

            if (!oper.isEmpty()) {
                select_operator_of_field(oper, criterion);
            }

            if (!value.isEmpty()) {
                input_search_value(value, type, criterion);
            }
        }
        click_btn_apply_advanced_search();
    }
}
