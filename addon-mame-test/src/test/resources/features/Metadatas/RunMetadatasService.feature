#Author: onguyent@tibco.com
@Metadatas-Service
Feature: Run Metadatas service
  As a datasteward
  I want to launch the Metadatas service
  so I display deduplication metadatas for a given record

  Background: 
    Given I login to EBX succesfully

  Scenario: SC-MTD007 Check the correctness of information which displays in Main tab when lauching metadata on a record which is Golden and auto-created is No
    When I access "Dataspaces" menu
    And I login to EBX succesfully
    When I access "Dataspaces" menu
    And I access dataspace "Reference-child"
    And I create child Dataspace with information as following
      | Identifier | Owner              | English Label |
      | $ID$       | admin admin(admin) |               |
    Then I should see Dataspace with information as following
      | Identifier | Type      | Creation | Status | Owner               | Loading strategy                | Child merge policy                 | Child dataspace sort policy |
      |            | Dataspace |          | Open   | admin admin (admin) | On-demand loading and unloading | Allows validation errors in result | By label                    |
    And I select dataspace service "View or edit datasets"
    Then The selected dataspace and its all datasets should be displayed on the left pannel
    And I access dataset "Store Item"
    And I access table "Categories"
    When I select some records as following
      | KEY | Identifier | Parent    |Name | Comment|                                               |
      |  01 |          1 | Fast food | Fast food |There is no commemt|
    And I select table service "Match and Merge > Metadatas"
    Then I should list tabs as following "<KEY>"
      | KEY | Tab name             | Record    | State  | Group    |Last matching process execution|Last matching execution date and time	|Last stewardship decision|Last stewardship decision user     |Last stewardship decision date and time|
      |  01 | Main                 | Fast food | Golden |Fast food |                               |                                      |                         | 
      |  02 | Execution log        |           |        |	         |[not defined]|                 |	[not defined]|                      |	Identified as match     |     admin                         |	20-80-2019 14:30:10|
    When I click "Preview" button beside the selected record
    Then I should see detailed record as following "<KEY>"
    | KEY | Identifier | Parent    |Name | Comment|                                               |
      |  01 |          1 | Fast food | Fast food |There is no commemt|
    When I click on "Preview" button beside group
    Then I should see manage group screen as following "<KEY>"
    | KEY | Header-breadcrumb     | Tab-index                                                                                     |  Padding   | State | Identifier | Parent    |Name | Comment|        | Text|
    |  01 | Manage group (Hoolong)| Please analyze the list of suspect records, you can validate them as duplicate or reject them | Duplicates | Golden | 1 | Fast food| | Fast food|There is no commemt||
    |  02 | Manage group (Hoolong)| Please analyze the list of suspect records, you can validate them as duplicate or reject them | Duplicates | Merged | 2 | Fast food| | Fast food 1 |There is no commemt1 |  
    |  03 | Manage group (Hoolong)| Please analyze the list of suspect records, you can validate them as duplicate or reject them | Suspects   |      |            |         |                          |No records found.|
    
  Scenario: SC-MTD008 Check group info when lauching metadata on a record that is apart of a group,  in this group there is one golden record.
    When I access "Dataspaces" menu
    And I login to EBX succesfully
    When I access "Dataspaces" menu
    And I access dataspace "Reference-child"
    And I create child Dataspace with information as following
      | Identifier | Owner              | English Label |
      | $ID$       | admin admin(admin) |               |
    Then I should see Dataspace with information as following
      | Identifier | Type      | Creation | Status | Owner               | Loading strategy                | Child merge policy                 | Child dataspace sort policy |
      |            | Dataspace |          | Open   | admin admin (admin) | On-demand loading and unloading | Allows validation errors in result | By label                    |
    And I select dataspace service "View or edit datasets"
    Then The selected dataspace and its all datasets should be displayed on the left pannel
    And I access dataset "Store Item"
    And I access table "Brands"
    When I select each record as following
      | KEY | Identifier | Name         | Address                          |
      |  01 |          6 | Hoolong | 48 Le Van Luong street, Thah Xuan district, Hanoi city |
      |  02 |          7 | Hoolong | Hoang Dao Thuy |
      |  03 |          8 | Hoolong 1 | 48 Le Van Luong street, Thah Xuan district, Hanoi city |
      |  04 |          9 | Hoolong 1 | 48 Le Van Luong street, Thah Xuan district, Hanoi city |
    And I select table service "Match and Merge > Metadatas"
    Then Then I should list tabs as following "<KEY>"
      | KEY  | Name         | Group|
      |  01  | Hoolong      | Hoolong 1  |
      |  02  | Hoolong      | Hoolong 1  |
      |  03  | Hoolong 1    | Hoolong 1  |
      |  04  | Hoolong 1    | Hoolong 1  |
      
      
    Scenario: SC-MTD009 Check group info when lauching metadata on a record that is apart of a group, in that group there are more than one golden records.
    When I access "Dataspaces" menu
    And I login to EBX succesfully
    When I access "Dataspaces" menu
    And I access dataspace "Reference-child"
    And I create child Dataspace with information as following
      | Identifier | Owner              | English Label |
      | $ID$       | admin admin(admin) |               |
    Then I should see Dataspace with information as following
      | Identifier | Type      | Creation | Status | Owner               | Loading strategy                | Child merge policy                 | Child dataspace sort policy |
      |            | Dataspace |          | Open   | admin admin (admin) | On-demand loading and unloading | Allows validation errors in result | By label                    |
    And I select dataspace service "View or edit datasets"
    Then The selected dataspace and its all datasets should be displayed on the left pannel
    And I access dataset "Store Item"
    And I access table "Stores"
    When I select each record as following
      | KEY | Identifier | Name         Type| | Address                          |
      |  01 |          1 | Texo US | Supermarket|[see details]|
      |  02 |          2 | Texovn | Supermarket |[see details]|
      |  03 |          3 | Texo | Supermarket |[see details]|
    And I select table service "Match and Merge > Metadatas"
    Then I should list tabs as following "<KEY>"
      | KEY  | Name         | Group  |
      |  01  | Texo US      |Texo US  |
      |  02  | Texovn      |Texo US  |
      |  03  | Texo US    |Texo US  |
    
    Scenario: SC-MTD010 Check group info when lauching metadata on a record that is apart of a group, in that group there is no golden record.
    And I login to EBX succesfully
    When I access "Dataspaces" menu
    And I access dataspace "Reference-child"
    And I create child Dataspace with information as following
      | Identifier | Owner              | English Label |
      | $ID$       | admin admin(admin) |               |
    Then I should see Dataspace with information as following
      | Identifier | Type      | Creation | Status | Owner               | Loading strategy                | Child merge policy                 | Child dataspace sort policy |
      |            | Dataspace |          | Open   | admin admin (admin) | On-demand loading and unloading | Allows validation errors in result | By label                    |
    And I select dataspace service "View or edit datasets"
    Then The selected dataspace and its all datasets should be displayed on the left pannel
    And I access dataset "Store Item"
    And I access table "Stores"
    When I select each record as following
      | KEY | Identifier | Name                  | Type        |Address      |
      |  01 |          4 | Hanoi Centerpoint UI	 |             |[see details]|
      |  02 |          5 | Hanoi Centerpoint     |             |[see details]|
      |  03 |          6 | Hanoi Centerpoint au  |             |[see details]|
    And I select table service "Match and Merge > Metadatas"
    Then  I should list tabs as following "<KEY>"
      | KEY  | Name                     | Group               |
      |  01  | Hanoi Centerpoint UI     |Hanoi Centerpoint UI |
      |  02  | Hanoi Centerpoint        |Hanoi Centerpoint UI |
      |  03  | Hanoi Centerpoint au     |Hanoi Centerpoint UI | 
    
  Scenario Outline: SC-MTD0013 - Check the correctness of displayed data after launching the Metadata service
                    SC-MTD0015-  Check the correctness of displayed data on the Main tab after launching the Metadata service on a record which is not Golden state.

    When I access "Dataspaces" menu
    And I login to EBX succesfully
    When I access "Dataspaces" menu
    And I access dataspace "Reference-child"
    And I create child Dataspace with information as following
      | Identifier | Owner              | English Label |
      | $ID$       | admin admin(admin) |               |
    Then I should see Dataspace with information as following
      | Identifier | Type      | Creation | Status | Owner               | Loading strategy                | Child merge policy                 | Child dataspace sort policy |
      |            | Dataspace |          | Open   | admin admin (admin) | On-demand loading and unloading | Allows validation errors in result | By label                    |
    And I select dataspace service "View or edit datasets"
    Then The selected dataspace and its all datasets should be displayed on the left pannel
    And I access dataset "Human_Resource"
    And I access table "National"
    When I select some records as following
      | KEY | Identifier | Name         | Employee | Website |         |
      |  01 |          6 | GoldenRecord |          |         |         |
      |  02 |          1 | US           |          |         | Preview |
    And I select table service "Match and Merge > Metadatas"
    Then I should list tabs as following "<KEY>"
      | KEY | Tab name |  Record                 | State            | Group                    | Target Record            |
      |  01 | Main     |  GoldenRecord           | [not defined]    | [not defined]            |                          |
      |  02 | Main     |  1 - US and Preview icon | Merged          | 10 - US and Preview icon | 10 - US and Preview icon |

    @CaseSC-MTD0013
    Examples: 
      | KEY |
      |  01 |

    @CaseSC-MTD0015
    Examples: 
      | KEY |
      |  02 |

  Scenario: SC-MTD0016 Check the correctness of displayed data on the Main tab after launching the Metadata service on a record which is Golden state and auto-created is Yes
    When I access "Dataspaces" menu
    And I login to EBX succesfully
    When I access "Dataspaces" menu
    And I access dataspace "Reference-child"
    And I create child Dataspace with information as following
      | Identifier | Owner              | English Label |
      | $ID$       | admin admin(admin) |               |
    Then I should see Dataspace with information as following
      | Identifier | Type      | Creation | Status | Owner               | Loading strategy                | Child merge policy                 | Child dataspace sort policy |
      |            | Dataspace |          | Open   | admin admin (admin) | On-demand loading and unloading | Allows validation errors in result | By label                    |
    And I select dataspace service "View or edit datasets"
    Then The selected dataspace and its all datasets should be displayed on the left pannel
    And I access dataset "Store Item"
    And I access table "Brands"
    When I select some records as following
      | KEY | Identifier  | Name                | Address                          |
      |  01 |          10 | MAIN SWITCHBOARD UK | PO Box 2884, Halfway House, 1685 |
    And I select table service "Match and Merge > Metadatas"
    Then I should list tabs as following "<KEY>"
      | KEY | Tab name | Record                 |Label|                                                    | State  | Group                |
      |  01 | Main     | MAIN SWITCHBOARDsUK    | This record has been auto-created from a merge operation | Golden | MAIN SWITCHBOARD UK  |
      
  Scenario: SC-MTD0017 Check the correctness of displayed data on the Main tab after launching the Metadata service on a record which is Golden state and auto-created is Yes
    When I access "Dataspaces" menu
    And I login to EBX succesfully
    When I access "Dataspaces" menu
    And I access dataspace "Reference-child"
    And I create child Dataspace with information as following
      | Identifier | Owner              | English Label |
      | $ID$       | admin admin(admin) |               |
    Then I should see Dataspace with information as following
      | Identifier | Type      | Creation | Status | Owner               | Loading strategy                | Child merge policy                 | Child dataspace sort policy |
      |            | Dataspace |          | Open   | admin admin (admin) | On-demand loading and unloading | Allows validation errors in result | By label                    |
    And I select dataspace service "View or edit datasets"
    Then The selected dataspace and its all datasets should be displayed on the left pannel
    And I access dataset "Store Item"
    And I access table "Brands"
    When I double click a record as following
      | KEY | Identifier  | Name                | Address                          |
      |  01 |          10 | MAIN SWITCHBOARD UK | PO Box 2884, Halfway House, 1685 |
    Then I should see detailed record as following "<KEY>"
       | KEY | Identifier  | Name                | Address                          |
       |  01 |          10 | MAIN SWITCHBOARD UK | PO Box 2884, Halfway House, 1685 |
    And I select record service "Match and Merge > Metadatas"
    Then I should list tabs as following "<KEY>"
      | KEY | Tab name | Record                 |Label|                                                    | State  | Group                |
      |  01 | Main     | MAIN SWITCHBOARDsUK    | This record has been auto-created from a merge operation | Golden | MAIN SWITCHBOARD UK  |
  
  