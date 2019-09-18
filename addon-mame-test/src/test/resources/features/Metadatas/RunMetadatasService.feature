#Author: onguyent@tibco.com
@Metadatas-Service
Feature: Run Metadatas service
  As a datasteward
  I want to launch the Metadatas service
  so I display deduplication metadatas for a given record

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
    When I select some records with primary key as following
      | Identifier |
      |          1 |
    And I select table service "Match and Merge > Metadatas"
    Then I should list tabs are "Main,Execution log"
    When I want to verify data displayed in main tab
      | Record    | State  | Group     |
      | Fast food | Golden | Fast food |
    When I want to see detail record
    Then I should see detailed record as following 
     | Identifier | Parent    | Name      | Comment             |
     |     1      | Fast food | Fast food | There is no commemt |
    When I want to come back metadata screen
    Then I should see detailed record as following
      | Identifier | Parent    | Name      | Comment             |
      |          1 | Fast food | Fast food | There is no commemt |
    When I want to see group of record
    Then I should see manage group of table "Fast food"
    And I should see Duplicates table as following
      | State  | Identifier | Parent    | Name | Comment     | Text                 |
      | Golden |          1 | Fast food |      | Fast food   | There is no commemt  |
      | Merged |          2 | Fast food |      | Fast food 1 | There is no commemt1 |
    And I should see the Suspects table as following
      | State | Identifier | Parent | Name | Comment | Text |


  
  #Scenario Outline: SC-MTD008 Check group info when lauching metadata on a record that is apart of a group,  in this group there is one golden record.
                   # SC-MTD009 Check group info when lauching metadata on a record that is apart of a group, in that group there are more than one golden records.
                   # SC-MTD010 Check group info when lauching metadata on a record that is apart of a group, in that group there is no golden record.

   # When I access "Dataspaces" menu
   # And I login to EBX succesfully
   # When I access "Dataspaces" menu
   # And I access dataspace "Reference-child"
    #And I create child Dataspace with information as following
     # | Identifier | Owner              | English Label |
     # | $ID$       | admin admin(admin) |               |
    #Then I should see Dataspace with information as following
    #  | Identifier | Type      | Creation | Status | Owner               | Loading strategy                | Child merge policy                 | Child dataspace sort policy |
    #  |            | Dataspace |          | Open   | admin admin (admin) | On-demand loading and unloading | Allows validation errors in result | By label                    |
    #And I select dataspace service "View or edit datasets"
   # And I access dataset "Store Item"
   # And I access table as following "<KEY>"
    #  | KEY | Table  |
   #   |  01 | Brand  |
    #  |  02 | Stores |
  #  When I select each record as following
    #  | KEY | Identifier | Name      | Address                                                |
    #  |  01 |          6 | Hoolong   | 48 Le Van Luong street, Thah Xuan district, Hanoi city |
    #  |  01 |          7 | Hoolong   | Hoang Dao Thuy                                         |
   #   |  01 |          8 | Hoolong 1 | 48 Le Van Luong street, Thah Xuan district, Hanoi city |
     # |  01 |          9 | Hoolong 1 | 48 Le Van Luong street, Thah Xuan district, Hanoi city |
   # And I select each record as following
    #  | KEY | Identifier | Name         Type    |             | Address       |
    #  |  02 |          1 | Texo US              | Supermarket | [see details] |
     # |  02 |          2 | Texovn               | Supermarket | [see details] |
     # |  02 |          3 | Texo                 | Supermarket | [see details] |
    #  |  02 |          4 | Hanoi Centerpoint UI |             | [see details] |
     # |  02 |          5 | Hanoi Centerpoint    |             | [see details] |
    #  |  02 |          6 | Hanoi Centerpoint au |             | [see details] |
   # And I select table service "Match and Merge > Metadatas"
    #Then I want to see group of record as following "<KEY>"
     # | KEY | Name      | Group     |
     # |  01 | Hoolong   | Hoolong 1 |
     # |  01 | Hoolong   | Hoolong 1 |
     # |  01 | Hoolong 1 | Hoolong 1 |
     # |  01 | Hoolong 1 | Hoolong 1 |
    #And I want to see group of record as following "<KEY>"
    #  | KEY | Name                 | Group                |
    #  |  02 | Texo US              | Texo US              |
    #  |  02 | Texovn               | Texo US              |
    #  |  02 | Texo US              | Texo US              |
   #   |  02 | Hanoi Centerpoint UI | Hanoi Centerpoint UI |
   #   |  02 | Hanoi Centerpoint    | Hanoi Centerpoint UI |
  #    |  02 | Hanoi Centerpoint au | Hanoi Centerpoint UI |

  
   # @CaseSC-MTD008, @SC-MTD010
   

 # Scenario Outline: 
             #       SC-MTD0015 Check the correctness of displayed data on the Main tab after launching the Metadata service on a record which is not Golden state.
              #      SC-MTD0016 Check the correctness of displayed data on the Main tab after launching the Metadata service on a record which is Golden state and auto-created is Yes

    #When I access "Dataspaces" menu
  #  And I login to EBX succesfully
   # When I access "Dataspaces" menu
    #And I access dataspace "Reference-child"
   # And I create child Dataspace with information as following
   #   | Identifier | Owner              | English Label |
    #  | $ID$       | admin admin(admin) |               |
   # Then I should see Dataspace with information as following
     # | Identifier | Type      | Creation | Status | Owner               | Loading strategy                | Child merge policy                 | Child dataspace sort policy |
   #   |            | Dataspace |          | Open   | admin admin (admin) | On-demand loading and unloading | Allows validation errors in result | By label                    |
    #And I select dataspace service "View or edit datasets"
   # And I access dataset "Store Item"
   # And I access table "Brands"
  # When I select some records as following
   #   | KEY | Identifier | Name                | Address                          |
     # |  01 |          1 | MAIN SWITCHBOARD UK | PO Box 2884, Halfway House, 1685 |
    # |  02 |         10 | MAIN SWITCHBOARD UK | PO Box 2884, Halfway House, 1685 |
    #And I select table service "Match and Merge > Metadatas"
   # Then I want to verify data displayed in main tab
   #   | KEY | Record              | Label                                                    | State  | Group               | Target Record       |
    #  |  01 | MAIN SWITCHBOARD UK |                                                          | Merged | MAIN SWITCHBOARD UK | MAIN SWITCHBOARD UK |
    #  |  02 | MAIN SWITCHBOARD UK | This record has been auto-created from a merge operation | Golden | MAIN SWITCHBOARD UK |                     |

   # @CaseSC-MTD0015
    

 # Scenario Outline: SC-MTD0017 Check when user accesses Metadata form from record level
   # When I access "Dataspaces" menu
   # And I login to EBX succesfully
    #When I access "Dataspaces" menu
    #And I access dataspace "Reference-child"
    #And I create child Dataspace with information as following
     # | Identifier | Owner              | English Label |
     # | $ID$       | admin admin(admin) |               |
    #Then I should see Dataspace with information as following
   #   | Identifier | Type      | Creation | Status | Owner               | Loading strategy                | Child merge policy                 | Child dataspace sort policy |
    #  |            | Dataspace |          | Open   | admin admin (admin) | On-demand loading and unloading | Allows validation errors in result | By label                    |
    #And I select dataspace service "View or edit datasets"
   # And I access dataset "Store Item"
   # And I access table "Brands"
    #When I double click a record as following
   #   | KEY | Identifier | Name                | Address                          |
    #  |  01 |         10 | MAIN SWITCHBOARD UK | PO Box 2884, Halfway House, 1685 |
    #Then I should see detailed record as following "<KEY>"
    #  | KEY | Identifier | Name                | Address                          |
    #  |  01 |         10 | MAIN SWITCHBOARD UK | PO Box 2884, Halfway House, 1685 |
    #And I select record service "Match and Merge > Metadatas"
    #Then I should list tabs as following "<KEY>"
   #   | KEY | Tab name | Record              | Label                                                    |        | State               | Group |
    #  |  01 | Main     | MAIN SWITCHBOARDsUK | This record has been auto-created from a merge operation | Golden | MAIN SWITCHBOARD UK |       |

    
