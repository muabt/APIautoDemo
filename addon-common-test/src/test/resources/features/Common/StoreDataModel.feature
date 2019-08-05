@STORE
Feature: Create new data model
  As user
  I want to create new Store Datamodel

  Background: 
    Given I login to EBX succesfully

  @Create-data-model
  Scenario Outline: Create new Data model
    When user want to create new Data Model has the name "StoreDataModel"
    And user creates tables with information as following with the "<KEY>"
      | KEY | Name      | Label and description English | French      | Kind of element |
      |  01 | Store     | Stores                        | Stores      | Table           |
      |  01 | Category  | Categories                    | Categories  | Table           |
      |  01 | Brand     | Brands                        | Brands      | Table           |
      |  01 | Item      | Items                         | Items       | Table           |
      |  01 | Inventory | Inventories                   | Inventories | Table           |
    And user creates complex data types as following with the "<KEY>"
      | KEY | Type name | Label and description English |
      |  01 | Address   | Address                       |
    And user creates element as following with the "<KEY>"
      | KEY | Table name | Field name | Label and description English | French   | Kind of element | Data type |
      |  01 | Address    | street     | Street                        | Street   | Field           | String    |
      |  01 | Address    | city       | City                          | City     | Field           | String    |
      |  01 | Address    | state      | State                         | State    | Field           | String    |
      |  01 | Address    | postcode   | Postcode                      | Postcode | Field           | String    |
      |  01 | Address    | country    | Country                       | Country  | Field           | String    |
    And user creates element as following with the "<KEY>"
      | KEY | Table name  | Field name   | Label and description English | French        | Kind of element      | Data type | Referenced table | Foreign key to current table |
      |  01 | Inventories | item         | Item                          | Item          | Field - PK - FK - ME |           | /root/Item       |                              |
      |  01 |             | store        | Store                         | Store         | Field - PK - FK - ME |           | /root/Store      |                              |
      |  01 |             | stock        | Stock                         | Stock         | Field - ME           | Integer   |                  |                              |
      |  01 |             | price        | Price                         | Price         | Field - ME           | Decimal   |                  |                              |
      |  01 | Categories  | identifier   | Identifier                    | Identifier    | Field - PK           | Integer   |                  |                              |
      |  01 |             | parent       | Parent                        | Parent        | Field - FK           |           | /root/Category   |                              |
      |  01 |             | name         | Name                          | Name          | Field - ME           | String    |                  |                              |
      |  01 |             | comment      | Comment                       | Comment       | Field                | String    |                  |                              |
      |  01 | Items       | identifier   | Identifier                    | Identifier    | Field - PK           | Integer   |                  |                              |
      |  01 |             | category     | Category                      | Category      | Field - FK - ME      |           | /root/Category   |                              |
      |  01 |             | brand        | Brand                         | Brand         | Field - FK           |           | /root/Brand      |                              |
      |  01 |             | name         | Name                          | Name          | Field - ME           | String    |                  |                              |
      |  01 |             | available    | Available                     | Available     | Field - ME           | Boolean   |                  |                              |
      |  01 |             | defaultPrice | Default Price                 | Default Price | Field - ME           | Decimal   |                  |                              |
      |  01 |             | inventories  | Inventories                   | Inventories   | Association          |           |                  | /root/Inventory/item         |
      |  01 | Stores      | identifier   | Identifier                    | Identifier    | Field - PK           | Integer   |                  |                              |
      |  01 |             | name         | Name                          | Name          | Field - ME           | String    |                  |                              |
      |  01 |             | address      | Address                       | Address       | Group                | Address   |                  |                              |
      |  01 |             | inventories  | Inventories                   | Inventories   | Association          |           |                  | /root/Inventory/store        |
      |  01 | Brands      | identifier   | Identifier                    | Identifier    | Field - PK           | Integer   |                  |                              |
      |  01 |             | name         | Name                          | Name          | Field - ME           | String    |                  |                              |
    And user publishes data model

    Examples: 
      | KEY |
      |  01 |
