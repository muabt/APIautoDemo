package com.orchestranetworks.auto.addon.defs.config;

import com.orchestranetworks.auto.addon.steps.CommonSteps;

import com.orchestranetworks.auto.addon.steps.config.FieldTrustedSourceSteps;
import com.orchestranetworks.auto.addon.steps.config.SourceSteps;
import com.orchestranetworks.auto.addon.steps.config.TableTrustedSourceSteps;
import com.orchestranetworks.auto.addon.utils.MAMEConstants;
import cucumber.api.DataTable;
import cucumber.api.java.en.And;
import net.serenitybdd.core.Serenity;
import net.thucydides.core.annotations.Steps;

import java.util.List;
import java.util.Map;

public class TrustedSourceDefs {
    @Steps
    SourceSteps onSourceSteps;
    @Steps
    TableTrustedSourceSteps onTableTrustedSourceSteps;
    @Steps
    FieldTrustedSourceSteps onFieldTrustedSourceSteps;
    @Steps
    CommonSteps onCommonSteps;


    @And("^the Source in Trusted source are$")
    public void the_source_in_trusted_source_are(DataTable dt) {
        onSourceSteps.access_source_table();

        List<Map<String, String>> list = dt.asMaps(String.class, String.class);
        for (Map<String, String> row : list) {
            String nameOfSource = row.get(MAMEConstants.NAME_OF_SOURCE_FIELD);
            String description = row.get("Description");

            if (!nameOfSource.isEmpty()) {
                if (!onSourceSteps.is_code_existed(nameOfSource)) {
                    onSourceSteps.click_create_record();
                    onSourceSteps.input_name_of_source(nameOfSource);
                } else {
                    onSourceSteps.select_source_record_with_name(nameOfSource);
                    onSourceSteps.delete_selected_record();
                    onSourceSteps.click_create_record();
                    onSourceSteps.input_name_of_source(nameOfSource);
                }
            }

            if (!description.isEmpty()) {
                onSourceSteps.input_description(description);
            }
        }
        onCommonSteps.click_btn_save_and_close();
    }

    @And("^the Table trusted source with the followings$")
    public void the_table_trusted_source_with_the_followings(DataTable dt) {
        onTableTrustedSourceSteps.access_table_trusted_source();

        List<Map<String, String>> list = dt.asMaps(String.class, String.class);
        for (Map<String, String> row : list) {
            String matchingTable = row.get(MAMEConstants.MATCHING_TABLE_FIELD);
            String trustedSourceList = row.get(MAMEConstants.TRUSTED_SOURCE_LIST);

            if (!matchingTable.isEmpty()) {
                if (!onSourceSteps.is_code_existed(matchingTable)) {
                    onTableTrustedSourceSteps.click_create_record();
                    onTableTrustedSourceSteps.select_matching_table(matchingTable);
                } else {
                    onSourceSteps.select_source_record_with_name(matchingTable);
                    onSourceSteps.delete_selected_record();
                    onTableTrustedSourceSteps.click_create_record();
                    onTableTrustedSourceSteps.select_matching_table(matchingTable);
                }

                if (!trustedSourceList.isEmpty()) {
                    onTableTrustedSourceSteps.add_trusted_source_list(trustedSourceList);
                }
            }
            onCommonSteps.click_btn_save_and_close();
        }
    }

    @And("^the Field trusted source with the followings$")
    public void the_field_trusted_source_with_the_followings(DataTable dt) {
        onFieldTrustedSourceSteps.access_field_trusted_source();

        List<Map<String, String>> list = dt.asMaps(String.class, String.class);
        for (Map<String, String> row : list) {
            String matchingTable = row.get(MAMEConstants.MATCHING_TABLE_FIELD);
            String field = row.get(MAMEConstants.FIELD);
            String trustedSourceList = row.get(MAMEConstants.TRUSTED_SOURCE_LIST);

            if (!matchingTable.isEmpty()) {
                if (!onSourceSteps.is_pk_existed(new String[]{matchingTable,field})) {
                    onFieldTrustedSourceSteps.click_create_record();
                    onFieldTrustedSourceSteps.select_matching_table(matchingTable);
                }else {
                    onFieldTrustedSourceSteps.select_record(matchingTable,field);
                    onSourceSteps.delete_selected_record();
                    onFieldTrustedSourceSteps.click_create_record();
                    onFieldTrustedSourceSteps.select_matching_table(matchingTable);
                }
            }
                if (!field.isEmpty()) {
                    onFieldTrustedSourceSteps.select_field_trusted_source(field);
                }
                if (!trustedSourceList.isEmpty()) {
                    onFieldTrustedSourceSteps.add_trusted_source_list(trustedSourceList);
                }
            }
            onCommonSteps.click_btn_save_and_close();
        }
    }
