package com.orchestranetworks.auto.addon.common.pages;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;

import com.orchestranetworks.auto.addon.Constants;
import com.orchestranetworks.auto.addon.FileUtils;
import com.orchestranetworks.auto.addon.SessionData;
import com.orchestranetworks.auto.addon.XFormat;
import com.orchestranetworks.auto.addon.common.WebPageObject;

public class DatasetPage extends WebPageObject {
	// Parent xpath
	static String fseparator = File.separator;

	private static String DOWNLOAD_FOLDER = FileUtils.getDataFolderPath() + "output";

	private static final String BTN_CREATE_A_RECORD = "Create a record";

	private static final String BTN_CREATE_A_DATASET = "Create a dataset";
	private static final String BTN_CLOSE_POPUP = "//div[@class='_ebx-pop-up_bottom']//*[.='Close']";
	private static final String BTN_SELECT_DATASET = "Select dataset";
	private static final String BTN_CHANGE_DATASPACE = "Change dataspace";
	private static final String LBL_PUBLICATION = "Publication";

	private static final String XPATH_POPUP_MESSAGE = "//div[@class='_ebx-pop-up']//*[@class='_ebx-notification-box_list_item']";
	private static final String XPATH_BTN_PERMISSIONS = "//span[text()='Permissions']";
	private static final String XPATH_TABLE = "//table[@class='ebx_tvFixed']";
	private static final String XPATH_RADIO_FIELD = "//tr[contains(@class,'ebx_Field') and not(@style='display: none;')][descendant::*[.='%s']]//*[@class='ebx_RadioButtonGroup']";
	private static final String XPATH_DLL_FIELD = "//tr[contains(@class,'ebx_Field') and not(@style='display: none;')][descendant::*[.='%s']]//button[@title='Open drop-down list']";
	private static final String XPATH_NO_RECORDS_FOUND = "//div[contains(@class,'tvMessageEmpty') and .='No records found.']";
	private static final String XPATH_NAVIGATION_PANEL = "//div[@class='_ebx-modeless-modal _ebx-modeless-modal-with-background']";
	public static final String NAVIGATION_ITEM = "//a//descendant-or-self::*[text()='%s']";
	public static final String XPATH_CHECKBOX_RECORD = "//div[@id='ebx_WorkspaceContent']//tr[(td[%1$s]) or (td/div[%1$s])]//input[@type='checkbox']";
	private static final String XPATH_DATASET_NAME = "//h2[contains(@class,'menu-selector-is-sub-title')]//span[@class='_ebx-documentation-label']";
	private static final String XPATH_EXPAND_BUTTON = "//label[contains(.,'%s')]//button[@title='expand']";
	private static final String XPATH_DATETIME = "//label[text()='%s']/ancestor::tr//span//input[contains(@name,'%s')]";
	private static final String XPATH_SORT_DESCENDING_FOR_FIELD = "//span[text()='%s']/ancestor::th[@title='Click to sort in descending order']";
	private static final String XPATH_TOTAL_SEARCH_RESULT = "(//div[@class='ebx_ToolsAlignRight']//button//span)[1]";

	private static final String XPATH_TBL_ROW = "//div[@id='ebx_workspaceTable_fixedScroller']//table[@class='ebx_tvFixed']/tbody/tr";
	private static final String XPATH_TBL_HEADER = "//div[@id='ebx_workspaceTable_headerContainer']//th[contains(@id,'tableField')]";

	public DatasetPage(WebDriver driver) {
		super(driver);
	}

	public void go_to_data_model(String path) {
		switchToLastIFrame();
		String[] itemList = path.split(">");
		collapseAll();
		for (int i = 0; i < itemList.length - 1; i++) {
			expandItem(itemList[i]);
			waitABit(2000);
		}
		selectNavigationMenuItem(itemList[itemList.length - 1]);
	}

	public void click_btn_change_dataspace() {
		switchOutDefaultIFrame();
		if (isElementExistNow(xPathBtn(BTN_CHANGE_DATASPACE))) {
			clickBtn(BTN_CHANGE_DATASPACE);
			waitForPresenceOfElement(XPATH_NAVIGATION_PANEL);
		}
	}

	public void go_to_navigation(String path) {
		String[] itemList = path.split(">");
		collapseAll();
		for (int i = 0; i < itemList.length - 1; i++) {
			expandItem(itemList[i].trim());
			waitABit(2000);
		}
		selectNavigationMenuItem(itemList[itemList.length - 1].trim());
	}

	public void click_btn_change_dataset() {
		boolean isPresent = findAllElement(XPATH_NAVIGATION_PANEL).size() > 0;
		if (!isPresent) {
			clickBtn(BTN_SELECT_DATASET);
			waitForPresenceOfElement(XPATH_NAVIGATION_PANEL);
		}
	}

	public void selectNavigationMenuItem(String item) {
		item = SessionData.getValueFromSession(item);
		clickOnElement(XFormat.of(NAVIGATION_ITEM, item));
	}

	public void select_table(String tableName) {
		clickOnElement(XFormat.of(NAVIGATION_ITEM, tableName));
	}

	// TrangLT
	public void go_to_group(String groupPath) {
		String[] groupitemList = groupPath.split(">");
		for (int i = 0; i < groupitemList.length - 1; i++) {
			selectNavigationMenuGroupItem(groupitemList[i]);
			waitABit(200);
		}
		selectNavigationMenuGroupItem(groupitemList[groupitemList.length - 1]);
	}

	public void selectNavigationMenuGroupItem(String item) {
		boolean isPresent = driver.findElements(By.xpath("//li[@data-key='/root']")).size() > 0;
		if (isPresent) {
			clickOnElement("//li[@data-key='/root," + item + "']//button[@title='Collapsed']");

		} else
			clickOnElement("//li[@data-key='" + item + "']//button[@title='Collapsed']");
	}

	public void selectNavigationMenuGroupItem1(String tablePath) {
		clickOnElement("//a[contains(@href,'" + tablePath + "')]");

	}

	/***********************************************/

	public void select_chkbox_display_option(String option) {
		checkCheckbox(option);
	}

	public void click_btn_action_table() {
		switchToLastIFrame();
		clickBtn("//div[@id='ebx_WorkspaceContent']", Constants.BTN_ACTIONS);

	}

	public void select_table_service(String service) {
		String[] services = service.split(">");
		for (int i = 0; i < services.length; i++) {
			clickOnElement(XFormat.of(NAVIGATION_ITEM, services[i].trim()));
		}
		waitForAllLoadingCompleted();
		switchToFirstIFrame();
		waitAbit(2000);
	}

	public void click_btn_close_popup() {
		clickOnElement(BTN_CLOSE_POPUP);
		waitForAllLoadingCompleted();
	}

	public boolean data_set_existed(String sUniqueName) {
		return isElementExistNow(XFormat.of(NAVIGATION_ITEM, sUniqueName));
	}

	public void click_btn_create_new_dataset() {
		clickBtn(BTN_CREATE_A_DATASET);
		waitForPresenceOfElement("//div[@class='_ebx-create-dataset']");
	}

	public void click_btn_data_model_type(String dataModelType) {
		clickBtn(dataModelType);

	}

	public void click_btn_next() {
		clickBtn(Constants.BTN_NEXT);

	}

	public void select_publication(String sPublication) {
		selectDDLBox(LBL_PUBLICATION, sPublication);

	}

	public void enter_unique_name(String name) {
		waitTypeAndTabWithLabel(Constants.LBL_UNIQUE_NAME, name);

	}

	public void enter_english_label(String sEnglishLabel) {
		waitTypeAndTabWithLabel(Constants.LBL_LABEL, sEnglishLabel);

	}

	public void click_btn_create() {
		clickBtn(Constants.BTN_CREATE);

	}

	public void click_btn_close() {
		clickBtn(Constants.BTN_CLOSE);
	}

	public void click_on_table(String tableName) {
		switchOutDefaultIFrame();
		clickOnElement(XFormat.of(NAVIGATION_ITEM, tableName));
		switchToLastIFrame();
		waitForPresenceOfElement(XPATH_TABLE);
	}

	// TODO need refactor
	public void click_btn_add_new_record() {
		waitForAllLoadingCompleted();
		switchToLastIFrame();
		clickBtn(BTN_CREATE_A_RECORD);

	}

	public void click_btn_save_and_close() {
		clickBtn(Constants.BTN_SAVE_AND_CLOSE);
	}

	public String get_text_cell(String label) {
		waitABit(5000);
		return getTextDataCell(1, getColumnIndexWithLabel(label));
	}

	public void click_to_sort_in_descending_order_for_field(String fieldName) {
		switchToIFrame(Constants.IFRAME_LEGACY);
		clickOnElement(XFormat.of(XPATH_SORT_DESCENDING_FOR_FIELD, fieldName));
	}

	public void click_btn_select_and_sort() {
		switchToLastIFrame();
		clickBtn(Constants.BTN_SELECT_AND_SORT);
	}

	public void select_all_record() {
		clickOnElement(XFormat.of(NAVIGATION_ITEM, "Select all in page"));
	}

	public void click_btn_action_dataset() {
		switchOutDefaultIFrame();
		clickBtn(Constants.BTN_ACTIONS);
	}

	public void select_dataset_service(String service) {
		String[] services = service.split(">");
		for (int i = 0; i < services.length; i++) {
			clickOnElement("//span[text()='" + services[i].trim() + "']");
		}
	}

	public boolean exist_record_in_table() {
		switchToLastIFrame();
		return !isElementExistNow(XPATH_NO_RECORDS_FOUND);
	}

	public String get_text_data_cell(String rowCode, String colCode) {
		int rowIndex = getRowIndexWithLabel(rowCode);
		int colIndex = getColumnIndexWithLabel(colCode);
		return getTextDataCell(rowIndex, colIndex);
	}

	public String check_field_type(String label) {
		String type = "INPUT";
		if (isElementExistNow(XFormat.of(XPATH_DLL_FIELD, label))) {
			type = "DDL";
		}
		if (isElementExistNow(XFormat.of(XPATH_RADIO_FIELD, label))) {
			type = "RADIO";
		}
		return type;
	}

	/*public void select_record_with_PK(String recordPK) {
		switchToLastIFrame();
		waitForPresenceOfElement(XPATH_TABLE);
		clickByJS(XFormat.of(XPATH_CHECKBOX_RECORD, sSpecialTextPredicates(recordPK)));

	}

	public void select_record_with_PK(String[] primaryKey) {
		String xPathRow = "//div[@id='ebx_WorkspaceContent']//tr[(td[%s])";
		primaryKey[0] = sSpecialTextPredicates(primaryKey[0]);
		if (primaryKey.length >= 2) {
			for (int i = 1; i < primaryKey.length; i++) {
				primaryKey[i] = sSpecialTextPredicates(primaryKey[i]);
				xPathRow += " and (td[%s])";
			}
		}
		xPathRow += "]";
		xPathRow = XFormat.of(xPathRow, primaryKey);
		switchToLastIFrame();
		clickByJS(xPathRow + "//input[@type='checkbox']");
	}
*/
	public void click_btn_permissions() {
		clickOnElement(XPATH_BTN_PERMISSIONS);
	}

	public void click_profile() {
		clickOnElement("//input[@type='text' and @value='[not defined]']");
	}

	public void choose_profile() {
		clickOnElement("//div[@id=\"ebx_ISS_Results\"]/div[contains(text(),'(admin)')]");

	}

	public void remove_choose_dataset_div() {
		waitForAllLoadingCompleted();
		boolean isPresent = findAllElement(XPATH_NAVIGATION_PANEL).size() > 0;
		if (isPresent) {
			((JavascriptExecutor) getDriver()).executeScript("arguments[0].style.visibility='hidden';",
					findBy(XPATH_NAVIGATION_PANEL));
			waitForInvisibilityOfElement(XPATH_NAVIGATION_PANEL);
		}
	}

	public void select_dataset(String keyTitle) {
		String child = SessionData.getValueFromSession(keyTitle);
		selectNavigationMenuItem(child);
	}

	private String get_text_dataset_name(String keyTitle) {
		waitForAllLoadingCompleted();
		String label = getElement(XPATH_DATASET_NAME).getText();
		SessionData.saveValueToSession(keyTitle, label);
		return label;
	}

	public void click_btn_create_child_dataset(String parentDataset) {
		clickBtn("//li[@data-key='" + parentDataset + "']", Constants.BTN_CREATE_CHILD_DATASET);
	}

	public void create_child_dataset(String parentDataset) {
		click_btn_create_child_dataset(parentDataset);
		get_name_new_dataset();
	}

	private void get_name_new_dataset() {
		String xpathUnique = "//input[@id='ebx-label-1']";
		String uniqName = getTextValue(xpathUnique);
		SessionData.saveValueToSession(Constants.CHILD_DATASET, uniqName);
	}

	public void click_btn_cancel() {
		clickBtn(Constants.BTN_CANCEL);
	}

	public void click_btn_duplicate() {
		clickBtn(Constants.BTN_DUPLICATE);
	}

	public void select_owner_child_dataset(String ownerName) {
		selectDDLBox(Constants.LBL_OWNER, ownerName);
	}

	public void input_dataset_label(String label) {
		waitTypeAndTabWithLabel(Constants.LBL_LABEL, label);
	}

	public void confirmation_OK() {
		confirmPopupOK();
	}

	public void select_dataset_owner(String owner) {
		selectDDLBox(Constants.LBL_OWNER, owner);

	}

	public void select_first_records(int numOfRecord) {
		for (int i = 1; i <= numOfRecord; i++) {
			select_record_with_index(i);
		}
	}

	public void select_record_with_index(int index) {
		String xPathSelectRecord = "(//td[@class='ebx_tvSelectCell']//input[@type='checkbox'])[" + index + "]";
		clickOnElement(xPathSelectRecord);
	}

	public void click_btn_expand_with_label(String label) {
		clickOnElement(XFormat.of(XPATH_EXPAND_BUTTON, label));
		waitForAllLoadingCompleted();
	}

	public void input_field_content(String col, String cell, String dataType) {
		waitForAllLoadingCompleted();
		switch (dataType) {
		case "TXT":
			waitTypeAndTabWithLabel(col, cell);
			break;
		case "DDL":
			inputDDLThenEnter(col, cell);
			break;
		case "RADIO":
			selectRadioBoxGroup(col, cell);
			break;
		case "DATE":
			input_date_time(col, cell);
			break;
		}
	}

	public void input_date_time(String label, String datetime) {
		String[] date = datetime.split("/");
		// input month value
		waitTypeAndTab(XFormat.of(XPATH_DATETIME, label, "month"), date[0]);
		// input date value
		waitTypeAndTab(XFormat.of(XPATH_DATETIME, label, "day"), date[1]);
		// input year value
		waitTypeAndTab(XFormat.of(XPATH_DATETIME, label, "year"), date[2]);
		waitABit(1000);
	}

	// TODO need refactor
	public void click_btn_create_record() {
		clickBtn(BTN_CREATE_A_RECORD);
	}

	public void input_table_record_with_label(String label, String name) {
		waitTypeAndTabWithLabel(label, name);
	}

	public String get_total_search_result() {
		return getTextValue(XPATH_TOTAL_SEARCH_RESULT);
	}

	public List<List<String>> getTableData() {
		List<List<String>> tbl = new ArrayList<List<String>>();
		List<String> lsHeader = getTableHeader();
		int numOfRow = findAllElement(XPATH_TBL_ROW).size();
		// Add header
		tbl.add(lsHeader);
		// Add List row
		for (int i = 1; i <= numOfRow; i++) {
			tbl.add(getTableRow(i, lsHeader.size()));
		}
		return tbl;
	}

	private List<String> getTableRow(int rowind, int numOfCol) {
		List<String> row = new ArrayList<String>();
		for (int j = 1; j <= numOfCol; j++) {
			row.add(getTextDataCell(rowind, j));
		}
		return row;
	}

	private List<String> getTableHeader() {
		List<String> listHeader = new ArrayList<String>();
		int numOfHeader = findAllElement(XPATH_TBL_HEADER).size();
		for (int i = 1; i <= numOfHeader; i++) {
			String xPathHeaderCell = "(" + XPATH_TBL_HEADER + ")[" + i + "]";
			String col = getText(xPathHeaderCell);
			listHeader.add(col);
		}
		return listHeader;
	}

	public String get_text_popup_message() {
		waitForAllLoadingCompleted();
		switchOutDefaultIFrame();
		String msg = getTextValue(XPATH_POPUP_MESSAGE).replaceAll("\n", " ");
		return msg;
	}

	private void deleteDownloadFolder() throws IOException {

		File files = new File(DOWNLOAD_FOLDER);
		FileUtils.deleteFiles(files);
	}

	public void click_btn_export() {
		try {
			deleteDownloadFolder();
		} catch (IOException e) {
			e.printStackTrace();
		}
		clickBtn(Constants.BTN_EXPORT);
		waitAbit(5000);
	}

	public void close_popup_with_frame() {
		switchToIFrame("ebx_InternalPopup_frame");
		clickBtn("Close");

	}

}
