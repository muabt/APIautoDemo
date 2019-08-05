package com.orchestranetworks.auto.addon.dint.defs;

import java.util.List;
import java.util.Map;

import com.orchestranetworks.auto.addon.common.steps.CommonSteps;
import com.orchestranetworks.auto.addon.dint.steps.ImportCSVFileSteps;

import cucumber.api.DataTable;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import net.thucydides.core.annotations.Steps;

public class ImportCSVFileDefs {
	@Steps
	ImportCSVFileSteps onImportCSVFileSteps;
	@Steps
	CommonSteps onCommonSteps;

	@And("^user upload CSV file with name \"([^\"]*)\"$")
	public void user_upload_csv_file_with_name_something(String fileName) throws Throwable {
		onImportCSVFileSteps.upload_file(fileName);
	}

	@And("^user click on Import button$")
	public void user_click_on_import_button() throws Throwable {
		onImportCSVFileSteps.click_btn_import();
	}

	@And("^user select options in import CSV view$")
	public void user_select_options_in_import_csv_view(DataTable dt) throws Throwable {
		// Convert from DataTable to List<Map>
		List<Map<String, String>> list = dt.asMaps(String.class, String.class);

		Map<String, String> row = list.get(0);

		// Get value according to Header
		String loadPre = row.get("Load preference");
		String firstRowContainHeader = row.get("First row contains header");
		String fieldSeparator = row.get("Field separator");
		String listSeparator = row.get("List separator");
		String delimiter = row.get("Delimiter");
		// check value null or not
		if (!loadPre.isEmpty()) {
			// steps
			onImportCSVFileSteps.selectLoadPreOptions(loadPre);
		}
		if (!firstRowContainHeader.isEmpty()) {
			onImportCSVFileSteps.selectFirstRowContainHeader(firstRowContainHeader);
		}
		if (!fieldSeparator.isEmpty()) {
			onImportCSVFileSteps.selectFieldSeparator(fieldSeparator);
		}
		if (!listSeparator.isEmpty()) {
			onImportCSVFileSteps.selectListSeparator(listSeparator);
		}
		if (!delimiter.isEmpty()) {
			onImportCSVFileSteps.inputDelimiter(delimiter);
		}
	}

	@And("^user select \"([^\"]*)\" of CSV view$")
	public void user_select_something_of_csv_view(String buttonLabel, DataTable dt) throws Throwable {
		onImportCSVFileSteps.click_expands_button(buttonLabel);
		List<Map<String, String>> list = dt.asMaps(String.class, String.class);

		Map<String, String> row = list.get(0);

		// Get value according to Header
		String importMode = row.get("Import mode");
		String useCaseSensitiveComparison = row.get("Use case-sensitive comparison when matching the header");
		String fileEncoding = row.get("File encoding");
		String decimalSymbol = row.get("Decimal symbol");
		String downloadFileOfInvalidData = row.get("Download file of invalid data");
		String ignoreEmptyOrNullValues = row.get("Ignore the empty or null values");
		String checkEmptyOrNullPrimaryKeys = row.get("Check empty or null primary keys");

		// check value null or not
		if (!importMode.isEmpty()) {
			// steps
			onImportCSVFileSteps.selectImportMode(importMode);
			System.out.println("Import mode: " + importMode);
		}
		if (!useCaseSensitiveComparison.isEmpty()) {
			onImportCSVFileSteps.selectUseCaseSensitiveComparison(useCaseSensitiveComparison);
		}
		if (!fileEncoding.isEmpty()) {
			onImportCSVFileSteps.selectFileEncoding(fileEncoding);
		}
		if (!decimalSymbol.isEmpty()) {
			onImportCSVFileSteps.selectDecimalSymbol(decimalSymbol);
		}
		if (!downloadFileOfInvalidData.isEmpty()) {
			onImportCSVFileSteps.selectDownloadFileOfInvalidData(downloadFileOfInvalidData);
		}
		if (!ignoreEmptyOrNullValues.isEmpty()) {
			onImportCSVFileSteps.selectIgnoreEmptyOrNullValues(ignoreEmptyOrNullValues);
		}
		if (!checkEmptyOrNullPrimaryKeys.isEmpty()) {
			onImportCSVFileSteps.selectCheckEmptyOrNullPrimaryKeys(checkEmptyOrNullPrimaryKeys);
		}
	}

	@And("^user selects options in \"([^\"]*)\" of CSV view$")
	public void user_selects_options_in_something_of_csv_view(String buttonLabel, DataTable dt) throws Throwable {
		onImportCSVFileSteps.click_expands_button(buttonLabel);
		List<Map<String, String>> list = dt.asMaps(String.class, String.class);

		Map<String, String> row = list.get(0);
		// Get value according to Header
		String commitThreshold = row.get("Commit threshold");
		String historyDeactivation = row.get("History deactivation");
		String databaseHistoryDeactivation = row.get("Database history deactivation");
		String triggerDeactivation = row.get("Trigger deactivation");
		String blockingConstrainsDeactivation = row.get("Blocking constrains deactivation");
		String datasetValidationDeactivation = row.get("Dataset validation deactivation");
		String allPrivileges = row.get("All privileges");

		// check value null or not
		if (!commitThreshold.isEmpty()) {
			// steps
			onImportCSVFileSteps.selectCommitThreshold(commitThreshold);
		}
		if (!historyDeactivation.isEmpty()) {
			onImportCSVFileSteps.selectHistoryDeactivation(historyDeactivation);
		}
		if (!databaseHistoryDeactivation.isEmpty()) {
			onImportCSVFileSteps.selectDatabaseHistoryDeactivation(databaseHistoryDeactivation);
		}
		if (!triggerDeactivation.isEmpty()) {
			onImportCSVFileSteps.selectTriggerDeactivation(triggerDeactivation);
		}
		if (!blockingConstrainsDeactivation.isEmpty()) {
			onImportCSVFileSteps.selectBlockingConstrainsDeactivation(blockingConstrainsDeactivation);
		}
		if (!datasetValidationDeactivation.isEmpty()) {
			onImportCSVFileSteps.selectDatasetValidationDeactivation(datasetValidationDeactivation);
		}
		if (!allPrivileges.isEmpty()) {
			onImportCSVFileSteps.selectAllPrivileges(allPrivileges);
		}

	}

	@Then("^should be imported successfully and the result view display with credentials$")
	public void should_be_imported_successfully_and_the_result_view_display_with_credentials(DataTable dt)
			throws Throwable {
		List<Map<String, String>> list = dt.asMaps(String.class, String.class);

		Map<String, String> row = list.get(0);
		// Get value according to Header
		String total = row.get("Total");
		String inserted = row.get("Inserted");
		String updated = row.get("Updated");
		String deleted = row.get("Deleted");
		String unchanged = row.get("Unchanged");
		String invalid = row.get("Invalid");
		if (!total.isEmpty()) {
			// steps
			onImportCSVFileSteps.verify_total_result(total);
		}
		if (!inserted.isEmpty()) {
			onImportCSVFileSteps.verify_inserted_records(inserted);
		}
		if (!updated.isEmpty()) {
			onImportCSVFileSteps.verify_updated_records(updated);
		}
		if (!deleted.isEmpty()) {
			onImportCSVFileSteps.verify_deleted_records(deleted);
		}
		if (!unchanged.isEmpty()) {
			onImportCSVFileSteps.verify_unchanged_records(unchanged);
		}
		if (!invalid.isEmpty()) {
			onImportCSVFileSteps.verify_invalid_records(invalid);
		}

	}
}
