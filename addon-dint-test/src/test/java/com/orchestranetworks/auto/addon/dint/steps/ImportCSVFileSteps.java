package com.orchestranetworks.auto.addon.dint.steps;

import org.junit.Assert;

import com.orchestranetworks.auto.addon.dint.pages.ImportCSVFilePage;
import com.orchestranetworks.auto.addon.dint.pages.ImportCSVResultPage;

import net.thucydides.core.annotations.Step;

public class ImportCSVFileSteps {
	ImportCSVFilePage onImportCSVFilePage;
	ImportCSVResultPage onImportCSVResultPage;

	@Step
	public void upload_file(String fileName) {
		onImportCSVFilePage.import_file(fileName);
	}

	@Step
	public void click_btn_import() {
		onImportCSVFilePage.click_on_import_btn();
	}

	@Step
	public void selectFirstRowContainHeader(String firstRowContainHeader) {
		onImportCSVFilePage.selectRadioBoxWithLabel(firstRowContainHeader);
	}

	@Step
	public void selectLoadPreOptions(String loadPre) {
		onImportCSVFilePage.selectDDLBox("", loadPre);
	}

	@Step
	public void selectFieldSeparator(String fieldSeparator) {
		onImportCSVFilePage.selectRadioBoxGroup("Field separator", fieldSeparator);
	}

	@Step
	public void selectListSeparator(String listSeparator) {
		onImportCSVFilePage.selectRadioBoxGroup("List separator", listSeparator);
	}

	@Step
	public void inputDelimiter(String delimiter) {
		onImportCSVFilePage.waitTypeAndTabWithLabel("Delimiter", delimiter);
	}

	@Step
	public void selectImportMode(String importMode) {
		onImportCSVFilePage.input_option_with_label("Import mode", importMode);
	}

	@Step
	public void selectUseCaseSensitiveComparison(String useCaseSensitiveComparison) {
		onImportCSVFilePage.select_radio_box("Use case-sensitive comparison when matching the header",
				useCaseSensitiveComparison);
	}

	@Step
	public void selectFileEncoding(String fileEncoding) {
		onImportCSVFilePage.input_option_with_label("File encoding", fileEncoding);
	}

	@Step
	public void selectDecimalSymbol(String decimalSymbol) {
		onImportCSVFilePage.select_radio_box("Decimal symbol", decimalSymbol);
	}

	@Step
	public void selectDownloadFileOfInvalidData(String downloadFileOfInvalidData) {
		onImportCSVFilePage.select_radio_box("Download file of invalid data", downloadFileOfInvalidData);
	}

	@Step
	public void selectIgnoreEmptyOrNullValues(String ignoreEmptyOrNullValues) {
		onImportCSVFilePage.select_radio_box("Ignore the empty or null values", ignoreEmptyOrNullValues);
	}

	@Step
	public void selectCheckEmptyOrNullPrimaryKeys(String checkEmptyOrNullPrimaryKeys) {
		onImportCSVFilePage.select_radio_box("Check empty or null primary keys", checkEmptyOrNullPrimaryKeys);
	}

	@Step
	public void click_expands_button(String buttonLabel) {
		onImportCSVFilePage.click_on_expands_button();

	}

	public void selectCommitThreshold(String commitThreshold) {
		onImportCSVFilePage.waitTypeAndTabWithLabel("Commit threshold", commitThreshold);

	}

	public void selectHistoryDeactivation(String historyDeactivation) {
		onImportCSVFilePage.select_radio_box("History deactivation", historyDeactivation);

	}

	public void selectDatabaseHistoryDeactivation(String databaseHistoryDeactivation) {
		onImportCSVFilePage.select_radio_box("Database history deactivation", databaseHistoryDeactivation);

	}

	public void selectTriggerDeactivation(String triggerDeactivation) {
		onImportCSVFilePage.select_radio_box("Trigger deactivation", triggerDeactivation);

	}

	public void selectBlockingConstrainsDeactivation(String blockingConstrainsDeactivation) {
		onImportCSVFilePage.select_radio_box("Blocking constrains deactivation", blockingConstrainsDeactivation);

	}

	public void selectDatasetValidationDeactivation(String datasetValidationDeactivation) {
		onImportCSVFilePage.select_radio_box("Dataset validation deactivation", datasetValidationDeactivation);

	}

	public void selectAllPrivileges(String allPrivileges) {
		onImportCSVFilePage.select_radio_box("All privileges", allPrivileges);
	}

	public void verify_total_result(String total) {
		Assert.assertEquals(total, onImportCSVResultPage.get_text_of_total_result());
	}

	public void verify_inserted_records(String inserted) {
		Assert.assertEquals(inserted, onImportCSVResultPage.get_text_of_inserted_records());

	}

	public void verify_updated_records(String updated) {
		Assert.assertEquals(updated, onImportCSVResultPage.get_text_of_updated_records());

	}

	public void verify_deleted_records(String deleted) {
		Assert.assertEquals(deleted, onImportCSVResultPage.get_text_of_deleted_records());

	}

	public void verify_unchanged_records(String unchanged) {
		Assert.assertEquals(unchanged, onImportCSVResultPage.get_text_of_unchanged_records());

	}

	public void verify_invalid_records(String invalid) {
		Assert.assertEquals(invalid, onImportCSVResultPage.get_text_of_invalid_records());

	}

}
