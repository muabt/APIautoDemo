#Author: onguyent@tibco.com
@SYSTEM
Feature: Run Metadatas service

  Background:
    Given I login to EBX successfully

  Scenario: SC-MTD013 Check the correctness of displayed data after launching the Metadata service
            SC-MTD007 Check the correctness of information which displays in Main tab when lauching metadata on a record which is Golden and auto-created is No
    And I create a child of dataspace "Reference-child" with information as following
      | Identifier | Owner              | English Label |
      |            | admin admin(admin) |               |
    Then I should see dataspace with information as following
      | Identifier | Type      | Creation | Status | Owner               | Loading strategy                | Child merge policy                 | Child dataspace sort policy |
      |            | Dataspace |          | Open   | admin admin (admin) | On-demand loading and unloading | Allows validation errors in result | By label                    |
    And I select dataspace service "View or edit datasets"
     And I access dataset "Store Item"
     And I access table "Categories"
    #And I access table "Categories" of dataset "Store Item" in dataspace "Reference-child"
    When I select some records with primary key as following
      | Identifier |
      | 1          |
    And I select table service "Match and Merge > Metadatas"
    When I want to verify data displayed in main tab
      | Record    | State  | Group     |
      | Fast food | Golden | Fast food |
    Then I should see detailed record as following
      | Identifier | Parent    | Name      | Comment             |
      |          1 | Fast food | Fast food | There is no commemt |
    Then I should see manage group of table "Fast food"
    And I should see Duplicates table as following
      | State  | Identifier | Parent    | Name        | Comment               |
      | Golden | 1          | Fast food | Fast food   | There is no commemt   |
      | Merged | 2          | Fast food | Fast food 1 | There is no commemt 1 |
    And I should see the Suspects table as following
      | State | Identifier | Parent | Name | Comment |
    And I should see text "No records found"

   Scenario: SC-MTD008 Check group info when lauching metadata on a record that is apart of a group,  in this group there is one golden record.
     And I create a child of dataspace "Reference-child" with information as following
       | Identifier | Owner              | English Label |
       |            | admin admin(admin) |               |
     Then I should see dataspace with information as following
       | Identifier | Type      | Creation | Status | Owner               | Loading strategy                | Child merge policy                 | Child dataspace sort policy |
       |            | Dataspace |          | Open   | admin admin (admin) | On-demand loading and unloading | Allows validation errors in result | By label                    |
     And I select dataspace service "View or edit datasets"
     And I access dataset "Store Item"
     And I access table "Brands"
    # And I access table "Brands" of dataset "Store Item" in dataspace "Reference-child"
     When I select some records with primary key as following
       | Identifier |
       | 6          |
     And I select table service "Match and Merge > Metadatas"
     When I want to verify data displayed in main tab
       | Record    | State  | Group     |Target Record|
       |Hoolong    | Merged | Hoolong 1 | Hoolong 1   |

  Scenario: SC-MTD009 Check group info when lauching metadata on a record that is apart of a group, in this group there are more than one golden records.
     And I create a child of dataspace "Reference-child" with information as following
       | Identifier | Owner              | English Label |
       |            | admin admin(admin) |               |
     Then I should see dataspace with information as following
       | Identifier | Type      | Creation | Status | Owner               | Loading strategy                | Child merge policy                 | Child dataspace sort policy |
       |            | Dataspace |          | Open   | admin admin (admin) | On-demand loading and unloading | Allows validation errors in result | By label                    |
     And I select dataspace service "View or edit datasets"
     And I access dataset "Store Item"
     And I access table "Stores"
    #And I access table "Stores" of dataset "Store Item" in dataspace "Reference-child"
    When I select some records with primary key as following
      | Identifier |
      | 2          |
    And I select table service "Match and Merge > Metadatas"
    When I want to verify data displayed in main tab
      | Record    | State  | Group     |Target Record|
      |Texovn     | Merged | Texo US   | Texo US     |

  Scenario: SC-MTD010 Check group info when lauching metadata on a record that is apart of a group, in that group there is no golden record.

     And I create a child of dataspace "Reference-child" with information as following
       | Identifier | Owner              | English Label |
       |            | admin admin(admin) |               |
     Then I should see dataspace with information as following
       | Identifier | Type      | Creation | Status | Owner               | Loading strategy                | Child merge policy                 | Child dataspace sort policy |
       |            | Dataspace |          | Open   | admin admin (admin) | On-demand loading and unloading | Allows validation errors in result | By label                    |
     And I select dataspace service "View or edit datasets"
     And I access dataset "Store Item"
     And I access table "Stores"
   # And I access table "Stores" of dataset "Store Item" in dataspace "Reference-child"
    When I select some records with primary key as following
      | Identifier |
      | 5          |
    And I select table service "Match and Merge > Metadatas"
    When I want to verify data displayed in main tab
      | Record               | State            | Group                  |
      |Hanoi Centerpoint     | Pending approval | Hanoi Centerpoint UI   |

  Scenario: SC-MTD015 Check the correctness of displayed data on the Main tab after launching the Metadata service on a record which is not Golden state.
     And I create a child of dataspace "Reference-child" with information as following
       | Identifier | Owner              | English Label |
       |            | admin admin(admin) |               |
     Then I should see dataspace with information as following
       | Identifier | Type      | Creation | Status | Owner               | Loading strategy                | Child merge policy                 | Child dataspace sort policy |
       |            | Dataspace |          | Open   | admin admin (admin) | On-demand loading and unloading | Allows validation errors in result | By label                    |
     And I select dataspace service "View or edit datasets"
     And I access dataset "Store Item"
     And I access table "Brands"
    When I select some records with primary key as following
      | Identifier |
      | 6          |
    And I select table service "Match and Merge > Metadatas"
    When I want to verify data displayed in main tab
      | Record    | State  | Group     |Target Record|
       |Hoolong    | Merged | Hoolong 1 | Hoolong 1   |

  Scenario: SC-MTD016 Check the correctness of displayed data on the Main tab after launching the Metadata service on a record which is Golden state and auto-created is Yes

#    And I create a child of dataspace "Reference-child" with information as following
#       | Identifier | Owner              | English Label |
#       |            | admin admin(admin) |               |
#     Then I should see dataspace with information as following
#       | Identifier | Type      | Creation | Status | Owner               | Loading strategy                | Child merge policy                 | Child dataspace sort policy |
#       |            | Dataspace |          | Open   | admin admin (admin) | On-demand loading and unloading | Allows validation errors in result | By label                    |
#     And I select dataspace service "View or edit datasets"
#     And I access dataset "Store Item"
#     And I access table "Brands"
    And I access table "Brands" of dataset "Store Item" in dataspace "Reference-child"
    When I select some records with primary key as following
      | Identifier |
      | 10          |
    And I select table service "Match and Merge > Metadatas"
    When I want to verify data displayed in main tab
      | Record                 | State  | Group     |
      |MAIN SWITCHBOARD UK     | Golden  | MAIN SWITCHBOARD UK |
    And Text "This record has been auto-created from a merge operation" will be displayed under Record info

#  Scenario: SC-MTD017 Check when user accesses Metadata form from record level
##    And I create a child of dataspace "Reference-child" with information as following
##       | Identifier | Owner              | English Label |
##       |            | admin admin(admin) |               |
##     Then I should see dataspace with information as following
##       | Identifier | Type      | Creation | Status | Owner               | Loading strategy                | Child merge policy                 | Child dataspace sort policy |
##       |            | Dataspace |          | Open   | admin admin (admin) | On-demand loading and unloading | Allows validation errors in result | By label                    |
##     And I select dataspace service "View or edit datasets"
##     And I access dataset "Store Item"
##     And I access table "Stores"
#    And I access table "Stores" of dataset "Store Item" in dataspace "Reference-child"
#    When I double click a record with primary key as following
#      | Identifier |
#      | 8          |
#    And I select record service "Match and Merge > Metadatas"
#    When I want to verify data displayed in main tab
#      | Record                 | State  | Group     |
#      |MAIN SWITCHBOARD UK     | Golden  | MAIN SWITCHBOARD UK |
