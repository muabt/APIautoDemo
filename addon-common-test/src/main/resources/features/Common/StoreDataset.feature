@STORE
Feature: Create new data model
  As user
  I want to create new Store data set

  @Create-data-set
  Scenario Outline: Create new data set
    Given user login to EBX succesfully
    When user wants to create data set "StoreDataset" from an embedded data model
    Given user accesses dataspace "FastTrack>[01] Reference data>Store"
    And user creates new dataset with information as following with the "<KEY>"
      | KEY | Publication    | Unique name  | Owner | English label | French label |
      |  01 | StoreDataModel | StoreDataset |       | StoreDataset  |              |
      |  02 | StoreDataModel | StoreDataset |       | StoreDataset  |              |
      |  03 | StoreDataModel | StoreDataset |       | StoreDataset  |              |
      |  04 | StoreDataModel | StoreDataset |       | StoreDataset  |              |
      |  05 | StoreDataModel | StoreDataset |       | StoreDataset  |              |
    When user wants to input data into table as following with the "<KEY>"
      | KEY | Table       |
      |  01 | Stores      |
      |  02 | Categories  |
      |  03 | Brands      |
      |  04 | Items       |
      |  05 | Inventories |
    And user input data table "Stores" as following with the "<KEY>"
      | KEY | Identifier | Name            | Street              | City          | State | Postcode | Country       |
      |  01 |          1 | Computer Market | 56 Kendall Square   | Boston        | MA    |    12870 | United States |
      |  01 |          2 | Phone Depot     | 19 Brookline Avenue | Austin        | TX    |    84743 | United States |
      |  01 |          3 | Cook Store      | 17 Tremont Street   | San Francisco | CA    |     9376 | United States |
      |  01 |          4 | Mister Freeze   | 92 Southwest Street | Miami         | FL    |    98056 | United States |
    Then the table "Stores" should be displayed as bellow with  the "<KEY>"
      | KEY | Identifier | Name            | Street              | City          | State | Postcode | Country       |
      |  01 |          1 | Computer Market | 56 Kendall Square   | Boston        | MA    |    12870 | United States |
      |  01 |          2 | Phone Depot     | 19 Brookline Avenue | Austin        | TX    |    84743 | United States |
      |  01 |          3 | Cook Store      | 17 Tremont Street   | San Francisco | CA    |     9376 | United States |
      |  01 |          4 | Mister Freeze   | 92 Southwest Street | Miami         | FL    |    98056 | United States |
    And user input data table "Categories" as following with the "<KEY>"
      | KEY | Identifier | Parent | Name          | Comment |
      |  02 |          1 |        | Electronics   |         |
      |  02 |          2 |      1 | Computers     |         |
      |  02 |          3 |      1 | Phones        |         |
      |  02 |          4 |        | Appliances    |         |
      |  02 |          5 |      4 | Cooking       |         |
      |  02 |          6 |      4 | Refrigeration |         |
    Then the table "Categories" should be displayed as bellow with  the "<KEY>"
      | KEY | Identifier | Parent | Name          | Comment |
      |  02 |          1 |        | Electronics   |         |
      |  02 |          2 |      1 | Computers     |         |
      |  02 |          3 |      1 | Phones        |         |
      |  02 |          4 |        | Appliances    |         |
      |  02 |          5 |      4 | Cooking       |         |
      |  02 |          6 |      4 | Refrigeration |         |
    And user input data table "Brands" as following with the "<KEY>"
      | KEY | Identifier | Name           |
      |  03 |          1 | Apricot        |
      |  03 |          2 | Sunny          |
      |  03 |          3 | Usual Electric |
      |  03 |          4 | Whitepool      |
    Then the table "Brands" should be displayed as bellow with  the "<KEY>"
      | KEY | Identifier | Name           |
      |  03 |          1 | Apricot        |
      |  03 |          2 | Sunny          |
      |  03 |          3 | Usual Electric |
      |  03 |          4 | Whitepool      |
    And user input data table "Items" as following with the "<KEY>"
      | KEY | Identifier | Category | Brand | Name           | Available | Default Price |
      |  04 |          1 |        2 |     1 | Laptop Pro     | Yes       |           720 |
      |  04 |          2 |        3 |     2 | Pocket Handy   | Yes       |           240 |
      |  04 |          3 |        5 |     3 | Star Cooker    | Yes       |           320 |
      |  04 |          4 |        6 |     4 | Energy Freezer | No        |           100 |
    Then the table "Items" should be displayed as bellow with  the "<KEY>"
      | KEY | Identifier | Category | Brand | Name           | Available | Default Price |
      |  04 |          1 |        2 |     1 | Laptop Pro     | Yes       |           720 |
      |  04 |          2 |        3 |     2 | Pocket Handy   | Yes       |           240 |
      |  04 |          3 |        5 |     3 | Star Cooker    | Yes       |           320 |
      |  04 |          4 |        6 |     4 | Energy Freezer | No        |           100 |
    And user input data table "Inventories" as following with the "<KEY>"
      | KEY | Item | Store | Stock | Price |
      |  05 |    1 |     1 |    16 |   699 |
      |  05 |    2 |     2 |     7 |   299 |
      |  05 |    3 |     3 |     9 |   399 |
      |  05 |    4 |     4 |     0 |   555 |
    Then the table "Inventories" should be displayed as bellow with  the "<KEY>"
      | KEY | Item | Store | Stock | Price |
      |  05 |    1 |     1 |    16 |   699 |
      |  05 |    2 |     2 |     7 |   299 |
      |  05 |    3 |     3 |     9 |   399 |
      |  05 |    4 |     4 |     0 |   555 |

    Examples: 
      | KEY |
      |  01 |
      |  02 |
      |  03 |
      |  04 |
      |  05 |
