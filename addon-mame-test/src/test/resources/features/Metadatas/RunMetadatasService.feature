#Author: onguyent@tibco.com
@Metadatas-Service
Feature: Run Metadatas service
  As a datasteward
  I want to launch the Metadatas service
  so I display deduplication metadatas for a given record

  Background: 
    Given I login to EBX succesfully

  Scenario Outline: SC-MTD0016 - Check the correctness of displayed data after launching the Metadata service
                    SC-MTD0019-  Check the correctness of displayed data on the Main tab after launching the Metadata service on a record which is not Golden state.

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
      |  03 |          6 | GoldenRecord |          |         |         |
    And I select table service "Match and Merge > Metadatas"
    Then I should list tabs as following "<KEY>"
      | KEY | Tab name             | Record                  | State  | Group                    | Target Record            |
      |  01 | Main  ,Execution log |                         |        |                          |                          |
      |  02 | Main                 | 1 - US and Preview icon | Merged | 10 - US and Preview icon | 10 - US and Preview icon |

    @CaseSC-MTD0016
    Examples: 
      | KEY |
      |  01 |

    @CaseSC-MTD0019
    Examples: 
      | KEY |
      |  02 |

  Scenario: SC-MTD0020 Check the correctness of displayed data on the Main tab after launching the Metadata service on a record which is Golden state and auto-created is Yes
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
      | KEY | Identifier | Name         | Address                          |
      |  01 |          5 | GoldenRecord | PO Box 2884, Halfway House, 1685 |
    And I select table service "Match and Merge > Metadatas"
    Then I should list tabs as following "<KEY>"
      | KEY | Tab name | Record                                                                                    | State  | Group             |
      |  01 | Main     | MAIN SWITCHBOARDs  and the label This record has been auto-created from a merge operation | Golden | MAIN SWITCHBOARDs |
