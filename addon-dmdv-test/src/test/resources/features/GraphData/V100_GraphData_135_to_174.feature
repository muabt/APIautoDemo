@DMDV100
Feature: Test graph data with configuration

  Background: 
    Given I login to EBX succesfully

  @Container
  Scenario: Data_135 - Check displayed correctly container relationship of nodes (that has an outgoing node on same table by a FK) when was Expanded/ Collapsed
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_135"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
      | A1 |
      | A2 |
    And user generates graph with configuration "Data_135"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #	|	Label |	Indicator	|	parentId	|
      | A2 | TOP |  |
    Then there is no link displayed
    #5. Right click on A2 and expand parent(table) A
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      #	|	Label |	Indicator	|	parentId	|
      | A2 | TOP | 1 |
      | A3 |     |   |
    Then there is no link displayed
    #6. Right click on A2 and collapse parent(table) A
    When user collapse parent on node "2"
    Then the label of all nodes is displayed as following
      | A2 | TOP |  |
    Then there is no link displayed
    #7. Repeated step 5-> 8 with recursively service of A2
    When user expands parent recursively on node "0"
    Then the label of all nodes is displayed as following
      | A2 | TOP | 1 |
      | A3 |     |   |
    Then there is no link displayed
    When user collapse parent recursively on node "2"
    Then the label of all nodes is displayed as following
      | A2 | TOP |  |
    Then there is no link displayed

  Scenario: Data_136 - Check displayed correctly container relationship of nodes (that has an outgoing node on same table by a FK) when was Expanded/ Collapsed
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_136"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
      | A1 |
      | A2 |
    And user generates graph with configuration "Data_136"
    Then the graph should be displayed
    #5. Right click on A1 and expand parent(table) A
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      #	|	Label |	Indicator	|	parentId	|
      | A2 | TOP,BOTTOM |   |
      | A4 |            |   |
      | A1 | TOP,BOTTOM | 2 |
    Then there is no link displayed
    #6. Right click on A1 and expand children(table) A
    When user expands children on node "3"
    Then the label of all nodes is displayed as following
      | A2 | TOP,BOTTOM |   |
      | A4 |            |   |
      | A1 | TOP,BOTTOM | 2 |
      | A3 |            | 3 |
    Then there is no link displayed
    #7. Right click on A1 and collapse parent(table) A
    When user collapse parent on node "3"
    Then the label of all nodes is displayed as following
      | A2 | TOP,BOTTOM |   |
      | A1 | TOP,BOTTOM |   |
      | A3 |            | 0 |
    Then there is no link displayed
    #8. Right click on A1 and collapse children(table) A
    When user collapse children on node "0"
    Then the label of all nodes is displayed as following
      | A2 | TOP,BOTTOM |  |
      | A1 | TOP,BOTTOM |  |
    Then there is no link displayed
    #9. Repeated step 5-> 8 with recursively service
    When user expands parent recursively on node "0"
    Then the label of all nodes is displayed as following
      | A2 | TOP,BOTTOM |   |
      | A4 |            |   |
      | A1 | TOP,BOTTOM | 2 |
    Then there is no link displayed
    When user expands children recursively on node "3"
    Then the label of all nodes is displayed as following
      | A2 | TOP,BOTTOM |   |
      | A4 |            |   |
      | A1 | TOP,BOTTOM | 2 |
      | A3 |            | 3 |
    Then there is no link displayed
    When user collapse parent recursively on node "3"
    Then the label of all nodes is displayed as following
      | A2 | TOP,BOTTOM |   |
      | A1 | TOP,BOTTOM |   |
      | A3 |            | 0 |
    Then there is no link displayed
    When user collapse children recursively on node "0"
    Then the label of all nodes is displayed as following
      | A2 | TOP,BOTTOM |  |
      | A1 | TOP,BOTTOM |  |
    Then there is no link displayed
    #10. Right click on A2 and expand parent(table) A
    When user expands parent on node "1"
    Then the label of all nodes is displayed as following
      #	|	Label |	Indicator	|	parentId	|
      | A1 | TOP,BOTTOM |  |
    Then there is no link displayed

  Scenario: Data_137 - Check displayed correctly container relationship of nodes (that has an incoming node on same table by many FKs) when was Expanded/ Collapsed
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_137"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
      | A1 |
      | A2 |
    And user generates graph with configuration "Data_135"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #	|	Label |	Indicator	|	parentId	|
      | A2 | BOTTOM |  |
    Then there is no link displayed
    #5. Right click on A2 and expand children(table) A
    When user expands children on node "0"
    Then the label of all nodes is displayed as following
      #	|	Label |	Indicator	|	parentId	|
      | A2 | BOTTOM |   |
      | A3 |        | 0 |
      | A4 |        | 0 |
    Then there is no link displayed
    #6. Right click on A2 and collapse children(table) A
    When user collapse children on node "0"
    Then the label of all nodes is displayed as following
      | A2 | BOTTOM |  |
    Then there is no link displayed
    #7. Repeated step 5-> 8 with recursively service of A2
    When user expands children recursively on node "0"
    Then the label of all nodes is displayed as following
      | A2 | BOTTOM |   |
      | A3 |        | 0 |
      | A4 |        | 0 |
    Then there is no link displayed
    When user collapse children recursively on node "0"
    Then the label of all nodes is displayed as following
      | A2 | BOTTOM |  |
    Then there is no link displayed

  Scenario: Data_138 - Check displayed correctly container relationship of nodes (that has an outgoing node on same table by many FKs) when was Expanded/ Collapsed
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_138"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
      | A1 |
      | A2 |
    And user generates graph with configuration "Data_138"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      #	|	Label |	Indicator	|	parentId	|
      | A2 | TOP |  |
    Then there is no link displayed
    #5. Right click on A2 and expand parent(table) A
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      #	|	Label |	Indicator	|	parentId	|
      | A3 |     |   |
      | A2 | TOP | 3 |
      | A2 | TOP | 1 |
      | Ax |     |   |
    Then there is no link displayed
    #6. Right click on A2 and collapse parent(table) A
    When user collapse parent on node "4"
    Then the label of all nodes is displayed as following
      | A2 | TOP |  |
    Then there is no link displayed
    #7. Repeated step 5-> 8 with recursively service of A2
    When user expands parent recursively on node "0"
    Then the label of all nodes is displayed as following
      | A3 |     |   |
      | A2 | TOP | 3 |
      | A2 | TOP | 1 |
      | Ax |     |   |
    Then there is no link displayed
    When user collapse parent recursively on node "2"
    Then the label of all nodes is displayed as following
      | A2 | TOP |  |
    Then there is no link displayed

  Scenario: Data_139 - Check displayed correctly container relationship of nodes (that have recursive and outgoing and incoming nodes on same table by many FKs) when was Expanded/ Collapsed
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_139"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
      | A1 |
      | A2 |
    And user generates graph with configuration "Data_139"
    Then the graph should be displayed
    #5. Right click on A1 and expand parent(table) A
    When user expands parent on node "1"
    Then the label of all nodes is displayed as following
      #	|	Label |	Indicator	|	parentId	|
      | A2 | TOP,BOTTOM |   |
      | A4 |            |   |
      | A1 | TOP,BOTTOM | 2 |
    Then there is no link displayed
    #6. Right click on A1 and expand children(table) A
    When user expands children on node "3"
    Then the label of all nodes is displayed as following
      | A2 | TOP,BOTTOM |   |
      | A4 |            |   |
      | A1 | TOP,BOTTOM | 2 |
      | A3 |            | 3 |
    Then there is no link displayed
    #7. Right click on A1 and collapse parent(table) A
    When user collapse parent on node "3"
    Then the label of all nodes is displayed as following
      | A2 | TOP,BOTTOM |   |
      | A1 | TOP,BOTTOM |   |
      | A3 |            | 1 |
    Then there is no link displayed
    #8. Right click on A1 and collapse children(table) A
    When user collapse children on node "1"
    Then the label of all nodes is displayed as following
      | A2 | TOP,BOTTOM |  |
      | A1 | TOP,BOTTOM |  |
    Then there is no link displayed
    #9. Repeated step 5-> 8 with recursively service
    When user expands parent recursively on node "1"
    Then the label of all nodes is displayed as following
      | A2 | TOP,BOTTOM |   |
      | A4 |            |   |
      | A1 | TOP,BOTTOM | 2 |
    Then there is no link displayed
    When user expands children recursively on node "3"
    Then the label of all nodes is displayed as following
      | A2 | TOP,BOTTOM |   |
      | A4 |            |   |
      | A1 | TOP,BOTTOM | 2 |
      | A3 |            | 3 |
    Then there is no link displayed
    When user collapse parent recursively on node "3"
    Then the label of all nodes is displayed as following
      | A2 | TOP,BOTTOM |   |
      | A1 | TOP,BOTTOM |   |
      | A3 |            | 1 |
    Then there is no link displayed
    When user collapse children recursively on node "1"
    Then the label of all nodes is displayed as following
      | A2 | TOP,BOTTOM |  |
      | A1 | TOP,BOTTOM |  |
    Then there is no link displayed
    #10. Right click on A2 and expand parent(table) A
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      #	|	Label |	Indicator	|	parentId	|
      | A1 | TOP,BOTTOM |  |
    Then there is no link displayed

  Scenario: Data_140 - Check displayed correctly container relationship of nodes (that have many incoming node on same table) when was Expanded/ Collapsed recursively
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_140"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_140"
    Then the graph should be displayed
    #5. Right click on Node and expand children(table) A
    When user expands children on node "0"
    Then the label of all nodes is displayed as following
      | A1 | BOTTOM |   |
      | A2 |        | 0 |
      | A3 |        | 0 |
      | A4 |        | 0 |
    Then there is no link displayed
    #6. Right click on Node and collapse children(table) A
    When user collapse children on node "0"
    Then the label of all nodes is displayed as following
      | A1 | BOTTOM |  |
    Then there is no link displayed
    #8. Repeated step 5-> 8 with recursively service
    When user expands children recursively on node "0"
    Then the label of all nodes is displayed as following
      | A1 | BOTTOM |   |
      | A2 |        | 0 |
      | A3 |        | 0 |
      | A4 |        | 0 |
    Then there is no link displayed
    When user collapse children recursively on node "0"
    Then the label of all nodes is displayed as following
      | A1 | BOTTOM |  |
    Then there is no link displayed

  Scenario: Data_141 - Check displayed correctly container relationship of nodes (that have many incoming node on same table) when was Expanded/ Collapsed many time
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_140"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_140"
    Then the graph should be displayed
    #5. Right click on Node and expand children(table) A
    When user expands children on node "0"
    Then the label of all nodes is displayed as following
      | A1 | BOTTOM |   |
      | A2 |        | 0 |
      | A3 |        | 0 |
      | A4 |        | 0 |
    Then there is no link displayed
    #6. Right click on Node and collapse children(table) A
    When user collapse children on node "0"
    Then the label of all nodes is displayed as following
      | A1 | BOTTOM |  |
    Then there is no link displayed
    #7.  Right click on Node and expand children(table) A
    When user expands children on node "0"
    Then the label of all nodes is displayed as following
      | A1 | BOTTOM |   |
      | A2 |        | 0 |
      | A3 |        | 0 |
      | A4 |        | 0 |
    Then there is no link displayed

  Scenario: Data_142 - Check displayed correctly container relationship of nodes (that have many incoming node on same table) when was started by it and a incoming nodes then Expand/ Collapse them
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_140"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
      | A1 |
      | A2 |
    And user generates graph with configuration "Data_140"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      | A1 | BOTTOM |   |
      | A2 |        | 0 |
    Then there is no link displayed
    #5. Right click on Node and expand children(table) A
    When user expands children on node "0"
    Then the label of all nodes is displayed as following
      | A1 | BOTTOM |   |
      | A2 |        | 0 |
      | A3 |        | 0 |
      | A4 |        | 0 |
    Then there is no link displayed
    #6. Right click on Node and collapse children(table) A
    When user collapse children on node "0"
    Then the label of all nodes is displayed as following
      | A1 | BOTTOM |   |
      | A2 |        | 0 |
    Then there is no link displayed
    #7.  Right click on Node and expand children(table) A
    When user expands children on node "0"
    Then the label of all nodes is displayed as following
      | A1 | BOTTOM |   |
      | A2 |        | 0 |
      | A3 |        | 0 |
      | A4 |        | 0 |
    Then there is no link displayed
    When user collapse children recursively on node "0"
    Then the label of all nodes is displayed as following
      | A1 | BOTTOM |   |
      | A2 |        | 0 |
    Then there is no link displayed

  Scenario: Data_143 - Check displayed correctly container relationship of nodes (that have many incoming node on same table) when was started by all nodes then Expand/ Collapse them
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_140"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
      | A1 |
      | A2 |
      | A3 |
      | A4 |
    And user generates graph with configuration "Data_140"
    Then the graph should be displayed
    When user expands children on node "0"
    Then the label of all nodes is displayed as following
      | A1 |  |   |
      | A2 |  | 0 |
      | A3 |  | 0 |
      | A4 |  | 0 |
    Then there is no link displayed

  Scenario: Data_144 - Check displayed correctly container relationship of nodes (that have many incoming node on same table) when was started by two incoming nodes then Expand/ Collapse them many time
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_140"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
      | A2 |
      | A3 |
    And user generates graph with configuration "Data_140"
    Then the graph should be displayed
    #5. Expand parent of  A3
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      | A1 | BOTTOM |   |
      | A3 | TOP    | 2 |
      | A2 |        | 2 |
    Then there is no link displayed
    #6. Expand children of A1
    When user expands children on node "2"
    Then the label of all nodes is displayed as following
      | A1 | BOTTOM |   |
      | A3 | TOP    | 2 |
      | A2 |        | 2 |
      | A4 |        | 2 |
    Then there is no link displayed
    #7. Collapse children of A1
    When user collapse children on node "2"
    Then the label of all nodes is displayed as following
      | A1 | BOTTOM |   |
      | A3 | TOP    | 2 |
      | A2 |        | 2 |
    Then there is no link displayed
    #8. Expand children of A1
    When user expands children on node "2"
    Then the label of all nodes is displayed as following
      | A1 | BOTTOM |   |
      | A3 | TOP    | 2 |
      | A2 |        | 2 |
      | A4 |        | 2 |
    Then there is no link displayed
    #9. Collapse parent of A3
    When user collapse parent on node "3"
    Then the label of all nodes is displayed as following
      | A3 | TOP |  |
      | A2 | TOP |  |
    Then there is no link displayed
    #11. Repeated step 5->9 with recursively service
    When user expands parent recursively on node "0"
    Then the label of all nodes is displayed as following
      | A1 | BOTTOM |   |
      | A3 | TOP    | 2 |
      | A2 |        | 2 |
    Then there is no link displayed
    When user expands children recursively on node "2"
    Then the label of all nodes is displayed as following
      | A1 | BOTTOM |   |
      | A3 | TOP    | 2 |
      | A2 |        | 2 |
      | A4 |        | 2 |
    Then there is no link displayed
    When user collapse children recursively on node "2"
    Then the label of all nodes is displayed as following
      | A1 | BOTTOM |   |
      | A3 | TOP    | 2 |
      | A2 |        | 2 |
    Then there is no link displayed
    When user collapse parent recursively on node "3"
    Then the label of all nodes is displayed as following
      | A3 | TOP |  |
      | A2 | TOP |  |
    Then there is no link displayed

  Scenario: Data_145 - Check displayed correctly container relationship of nodes (that have many incoming node on same table) when was started by two incoming nodes then Expand/ Collapse them
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_140"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
      | A2 |
      | A3 |
    And user generates graph with configuration "Data_140"
    Then the graph should be displayed
    #5. Expand parent of A2
    When user expands parent on node "1"
    Then the label of all nodes is displayed as following
      | A1 | BOTTOM |   |
      | A3 |        | 2 |
      | A2 | TOP    | 2 |
    Then there is no link displayed
    #7. Collapse parent of A2
    When user collapse parent on node "4"
    Then the label of all nodes is displayed as following
      | A3 | TOP |  |
      | A2 | TOP |  |
    Then there is no link displayed
    #8. Expand parent of A2
    When user expands parent on node "1"
    Then the label of all nodes is displayed as following
      | A1 | BOTTOM |   |
      | A3 |        | 2 |
      | A2 | TOP    | 2 |
    Then there is no link displayed
    #9. Expand children of A1
    When user expands children on node "2"
    Then the label of all nodes is displayed as following
      | A1 | BOTTOM |   |
      | A3 |        | 2 |
      | A2 | TOP    | 2 |
      | A4 |        | 2 |
    Then there is no link displayed
    #7. Collapse parent of A2
    When user collapse parent on node "4"
    Then the label of all nodes is displayed as following
      | A3 | TOP |  |
      | A2 | TOP |  |
    Then there is no link displayed
    #11. Repeated step 5->9 with recursively service
    #5. Expand parent of A2
    When user expands parent recursively on node "1"
    Then the label of all nodes is displayed as following
      | A1 | BOTTOM |   |
      | A3 |        | 2 |
      | A2 | TOP    | 2 |
    Then there is no link displayed
    #7. Collapse parent of A2
    When user collapse parent recursively on node "4"
    Then the label of all nodes is displayed as following
      | A3 | TOP |  |
      | A2 | TOP |  |
    Then there is no link displayed
    #8. Expand parent of A2
    When user expands parent recursively on node "1"
    Then the label of all nodes is displayed as following
      | A1 | BOTTOM |   |
      | A3 |        | 2 |
      | A2 | TOP    | 2 |
    Then there is no link displayed
    #9. Expand children of A1
    When user expands children recursively on node "2"
    Then the label of all nodes is displayed as following
      | A1 | BOTTOM |   |
      | A3 |        | 2 |
      | A2 | TOP    | 2 |
      | A4 |        | 2 |
    Then there is no link displayed

  Scenario: Data_146 - Check displayed correctly container relationship of nodes (that have many outgoing nodes on same table) when was Expanded/ Collapsed
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_146"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_146"
    Then the graph should be displayed
    #5. Expand parent of  A1
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      | A1 | TOP | 2 |
      | A1 | TOP | 4 |
      | A2 |     |   |
      | A3 |     |   |
      | A1 | TOP | 6 |
      | Ax |     |   |
    Then there is no link displayed
    #6. Collapse parent of A1
    When user collapse parent on node "1"
    Then the label of all nodes is displayed as following
      | A1 | TOP |  |
    Then there is no link displayed
    #7. Repeated step 5->9 with recursively service
    When user expands parent recursively on node "0"
    Then the label of all nodes is displayed as following
      | A1 | TOP | 2 |
      | A1 | TOP | 4 |
      | A2 |     |   |
      | A3 |     |   |
      | A1 | TOP | 6 |
      | Ax |     |   |
    Then there is no link displayed
    When user collapse parent recursively on node "1"
    Then the label of all nodes is displayed as following
      | A1 | TOP |  |
    Then there is no link displayed

  Scenario: Data_147 - Check displayed correctly container relationship of nodes (that have many outgoing nodes on same table) when was Expanded/ Collapsed many time
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_146"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_146"
    Then the graph should be displayed
    #5. Expand parent of  A1
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      | A1 | TOP | 2 |
      | A1 | TOP | 4 |
      | A2 |     |   |
      | A3 |     |   |
      | A1 | TOP | 6 |
      | Ax |     |   |
    Then there is no link displayed
    #6. Collapse parent of A1
    When user collapse parent on node "1"
    Then the label of all nodes is displayed as following
      | A1 | TOP |  |
    Then there is no link displayed
    #7. Expand parent of A1
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      | A1 | TOP | 2 |
      | A1 | TOP | 4 |
      | A2 |     |   |
      | A3 |     |   |
      | A1 | TOP | 6 |
      | Ax |     |   |
    Then there is no link displayed
    #8. Collapse parent of A1
    When user collapse parent on node "1"
    Then the label of all nodes is displayed as following
      | A1 | TOP |  |
    Then there is no link displayed
    #9. Repeated step 5->9 with recursively service
    When user expands parent recursively on node "0"
    Then the label of all nodes is displayed as following
      | A1 | TOP | 2 |
      | A1 | TOP | 4 |
      | A2 |     |   |
      | A3 |     |   |
      | A1 | TOP | 6 |
      | Ax |     |   |
    Then there is no link displayed
    When user collapse parent recursively on node "1"
    Then the label of all nodes is displayed as following
      | A1 | TOP |  |
    Then there is no link displayed

  Scenario: Data_148 - Check displayed correctly container relationship of nodes (that have many outgoing nodes on same table) when was started by it and a incoming nodes then Expand/ Collapse them
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_146"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
      | A1 |
      | A2 |
    And user generates graph with configuration "Data_146"
    Then the graph should be displayed
    #5. Expand parent of A1
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      | A1 | TOP | 1 |
      | A2 |     |   |
      | A1 | TOP | 3 |
      | A3 |     |   |
      | A1 | TOP | 5 |
      | Ax |     |   |
    Then there is no link displayed
    #6. Collapse parent of A1
    When user collapse parent on node "0"
    Then the label of all nodes is displayed as following
      | A1 | TOP | 1 |
      | A2 |     |   |
    Then there is no link displayed
    #7. Repeated step 5->9 with recursively service
    When user expands parent recursively on node "0"
    Then the label of all nodes is displayed as following
      | A1 | TOP | 1 |
      | A2 |     |   |
      | A1 | TOP | 3 |
      | A3 |     |   |
      | A1 | TOP | 5 |
      | Ax |     |   |
    Then there is no link displayed
    When user collapse parent recursively on node "0"
    Then the label of all nodes is displayed as following
      | A1 | TOP | 1 |
      | A2 |     |   |
    Then there is no link displayed

  Scenario: Data_149 - Check displayed correctly container relationship of nodes (that have many outgoing nodes on same table) when was started by all nodes then Expand/ Collapse them
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_146"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
      | A1 |
      | A2 |
      | A3 |
      | Ax |
    And user generates graph with configuration "Data_146"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      | A1 |  | 1 |
      | A2 |  |   |
      | A1 |  | 3 |
      | A3 |  |   |
      | A1 |  | 5 |
      | Ax |  |   |
    Then there is no link displayed

  Scenario: Data_150 - Check displayed correctly container relationship of nodes (that have many outgoing nodes on same table) when was started by two incoming nodes then Expand/ Collapse them many time
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_146"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
      | A2 |
      | A3 |
    And user generates graph with configuration "Data_146"
    Then the graph should be displayed
    #5. Expand children of A3
    When user expands children on node "1"
    Then the label of all nodes is displayed as following
      | A2 |        |   |
      | A3 | BOTTOM |   |
      | A1 | TOP    | 1 |
      | A1 | TOP    | 0 |
    Then there is no link displayed
    #6. Expand parent of A1
    When user expands parent on node "2"
    Then the label of all nodes is displayed as following
      | A2 |        |   |
      | A3 | BOTTOM |   |
      | A1 |        | 1 |
      | A1 | TOP    | 0 |
      | A1 | TOP    | 5 |
      | Ax |        |   |
    Then there is no link displayed
    #7. Collapse parent of A1
    When user collapse parent on node "2"
    Then the label of all nodes is displayed as following
      | A2 |        |   |
      | A3 | BOTTOM |   |
      | A1 | TOP    | 1 |
      | A1 | TOP    | 0 |
    Then there is no link displayed
    #8. Expand parent of A1
    When user expands parent on node "2"
    Then the label of all nodes is displayed as following
      | A2 |        |   |
      | A3 | BOTTOM |   |
      | A1 |        | 1 |
      | A1 | TOP    | 0 |
      | A1 | TOP    | 5 |
      | Ax |        |   |
    Then there is no link displayed
    #9. Collapse children of A3
    When user collapse children on node "1"
    Then the label of all nodes is displayed as following
      | A2 | BOTTOM |  |
      | A3 | BOTTOM |  |
    Then there is no link displayed
    #10. Expand children of A3
    When user expands children on node "1"
    Then the label of all nodes is displayed as following
      | A2 |        |   |
      | A3 | BOTTOM |   |
      | A1 | TOP    | 1 |
      | A1 | TOP    | 0 |
    Then there is no link displayed
    #11. Repeated step 5->9 with recursively service
    #5. Expand children of A3
    When user expands children recursively on node "1"
    Then the label of all nodes is displayed as following
      | A2 |        |   |
      | A3 | BOTTOM |   |
      | A1 | TOP    | 1 |
      | A1 | TOP    | 0 |
    Then there is no link displayed
    #6. Expand parent of A1
    When user expands parent recursively on node "2"
    Then the label of all nodes is displayed as following
      | A2 |        |   |
      | A3 | BOTTOM |   |
      | A1 |        | 1 |
      | A1 | TOP    | 0 |
      | A1 | TOP    | 5 |
      | Ax |        |   |
    Then there is no link displayed
    #7. Collapse parent of A1
    When user collapse parent recursively on node "2"
    Then the label of all nodes is displayed as following
      | A2 |        |   |
      | A3 | BOTTOM |   |
      | A1 | TOP    | 1 |
      | A1 | TOP    | 0 |
    Then there is no link displayed
    #8. Expand parent of A1
    When user expands parent recursively on node "2"
    Then the label of all nodes is displayed as following
      | A2 |        |   |
      | A3 | BOTTOM |   |
      | A1 |        | 1 |
      | A1 | TOP    | 0 |
      | A1 | TOP    | 5 |
      | Ax |        |   |
    Then there is no link displayed
    #9. Collapse children of A3
    When user collapse children recursively on node "1"
    Then the label of all nodes is displayed as following
      | A2 | BOTTOM |  |
      | A3 | BOTTOM |  |
    Then there is no link displayed
    #10. Expand children of A3
    When user expands children recursively on node "1"
    Then the label of all nodes is displayed as following
      | A2 |        |   |
      | A3 | BOTTOM |   |
      | A1 | TOP    | 1 |
      | A1 | TOP    | 0 |
    Then there is no link displayed

  Scenario: Data_151 - Check displayed correctly container relationship of nodes (that have many outgoing nodes on same table) when was started by two incoming nodes then Expand/ Collapse them
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_146"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
      | A2 |
      | A3 |
    And user generates graph with configuration "Data_146"
    Then the graph should be displayed
    #5. Expand children of A2
    When user expands children on node "0"
    Then the label of all nodes is displayed as following
      | A2 | BOTTOM |   |
      | A3 |        |   |
      | A1 | TOP    | 1 |
      | A1 | TOP    | 0 |
    Then there is no link displayed
    #7. Collapse children of A2
    When user collapse children on node "0"
    Then the label of all nodes is displayed as following
      | A2 | BOTTOM |  |
      | A3 | BOTTOM |  |
    Then there is no link displayed
    #8. Expand children of A2
    When user expands children on node "0"
    Then the label of all nodes is displayed as following
      | A2 | BOTTOM |   |
      | A3 |        |   |
      | A1 | TOP    | 1 |
      | A1 | TOP    | 0 |
    Then there is no link displayed
    #9. Expand parent of A1
    When user expands parent on node "2"
    Then the label of all nodes is displayed as following
      | A2 | BOTTOM |   |
      | A3 |        |   |
      | A1 | TOP    | 1 |
      | A1 |        | 0 |
      | A1 | TOP    | 5 |
      | Ax |        |   |
    Then there is no link displayed
    #10. Collapse children of A2
    When user collapse children on node "0"
    Then the label of all nodes is displayed as following
      | A2 | BOTTOM |  |
      | A3 | BOTTOM |  |
    Then there is no link displayed
    #11. Repeated step 5->9 with recursively service
    #5. Expand children of A2
    When user expands children recursively on node "0"
    Then the label of all nodes is displayed as following
      | A2 | BOTTOM |   |
      | A3 |        |   |
      | A1 | TOP    | 1 |
      | A1 | TOP    | 0 |
    Then there is no link displayed
    #7. Collapse children of A2
    When user collapse children recursively on node "0"
    Then the label of all nodes is displayed as following
      | A2 | BOTTOM |  |
      | A3 | BOTTOM |  |
    Then there is no link displayed
    #8. Expand children of A2
    When user expands children recursively on node "0"
    Then the label of all nodes is displayed as following
      | A2 | BOTTOM |   |
      | A3 |        |   |
      | A1 | TOP    | 1 |
      | A1 | TOP    | 0 |
    Then there is no link displayed
    #9. Expand parent of A1
    When user expands parent recursively on node "2"
    Then the label of all nodes is displayed as following
      | A2 | BOTTOM |   |
      | A3 |        |   |
      | A1 | TOP    | 1 |
      | A1 |        | 0 |
      | A1 | TOP    | 5 |
      | Ax |        |   |
    Then there is no link displayed

  Scenario: Data_152 - Check displayed correctly container relationship of nodes (that have many incoming&outgoing nodes on same table) when was Expanded
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_152"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_152"
    Then the graph should be displayed
    #5. Expand parent of A1
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      | A2 |            |   |
      | A3 |            |   |
      | A1 | TOP,BOTTOM | 2 |
      | A1 | TOP,BOTTOM | 1 |
    Then there is no link displayed
    #6. Expand children of A1
    When user expands children on node "3"
    Then the label of all nodes is displayed as following
      | A2 |            |   |
      | A3 |            |   |
      | A1 | TOP,BOTTOM | 2 |
      | A1 | TOP,BOTTOM | 1 |
      | A4 |            | 3 |
      | A5 |            | 3 |
      | A4 |            | 4 |
      | A5 |            | 4 |
    Then there is no link displayed
    #7. Collapse children of A1
    When user collapse children on node "3"
    Then the label of all nodes is displayed as following
      | A2 |            |   |
      | A3 |            |   |
      | A1 | TOP,BOTTOM | 2 |
      | A1 | TOP,BOTTOM | 1 |
    Then there is no link displayed
    #8. Collapse parent of A1
    When user collapse parent on node "3"
    Then the label of all nodes is displayed as following
      | A1 | TOP,BOTTOM |  |
    Then there is no link displayed
    #9. Repeated step 5->6 with recursively service
    When user expands parent recursively on node "0"
    Then the label of all nodes is displayed as following
      | A2 |            |   |
      | A3 |            |   |
      | A1 | TOP,BOTTOM | 2 |
      | A1 | TOP,BOTTOM | 1 |
    Then there is no link displayed
    When user expands children recursively on node "3"
    Then the label of all nodes is displayed as following
      | A2 |            |   |
      | A3 |            |   |
      | A1 | TOP,BOTTOM | 2 |
      | A1 | TOP,BOTTOM | 1 |
      | A4 |            | 3 |
      | A5 |            | 3 |
      | A4 |            | 4 |
      | A5 |            | 4 |
    Then there is no link displayed

  Scenario: Data_153 - Check displayed correctly container relationship of nodes (that have many incoming&outgoing nodes on same table) when was started by it and a outgoing nodes then Expand/ Collapse them
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_152"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
      | A1 |
      | A2 |
      | A4 |
    And user generates graph with configuration "Data_152"
    Then the graph should be displayed
    #6. Expand parent of A1
    When user expands parent on node "1"
    Then the label of all nodes is displayed as following
      | A2 |            |   |
      | A1 | TOP,BOTTOM | 0 |
      | A4 |            | 1 |
      | A4 |            | 4 |
      | A3 |            |   |
      | A1 | TOP,BOTTOM | 5 |
    Then there is no link displayed
    #7. Expand children of A1
    When user expands children on node "1"
    Then the label of all nodes is displayed as following
      | A2 |            |   |
      | A1 | TOP,BOTTOM | 0 |
      | A4 |            | 1 |
      | A4 |            | 4 |
      | A3 |            |   |
      | A1 | TOP,BOTTOM | 5 |
      | A5 |            | 4 |
      | A5 |            | 1 |
    Then there is no link displayed
    #8. Collapse parent  A1
    When user collapse parent on node "1"
    Then the label of all nodes is displayed as following
      | A2 |            |   |
      | A1 | TOP,BOTTOM | 0 |
      | A4 |            | 1 |
      | A5 |            | 1 |
    Then there is no link displayed
    #9. Collapse children  A1
    When user collapse children on node "1"
    Then the label of all nodes is displayed as following
      | A2 |            |   |
      | A1 | TOP,BOTTOM | 0 |
      | A4 |            | 1 |
    Then there is no link displayed
    #12. Repeated step 5->9 with recursively service
    #6. Expand parent of A1
    When user expands parent recursively on node "1"
    Then the label of all nodes is displayed as following
      | A2 |            |   |
      | A1 | TOP,BOTTOM | 0 |
      | A4 |            | 1 |
      | A4 |            | 4 |
      | A3 |            |   |
      | A1 | TOP,BOTTOM | 5 |
    Then there is no link displayed
    #7. Expand children of A1
    When user expands children recursively on node "1"
    Then the label of all nodes is displayed as following
      | A2 |            |   |
      | A1 | TOP,BOTTOM | 0 |
      | A4 |            | 1 |
      | A4 |            | 4 |
      | A3 |            |   |
      | A1 | TOP,BOTTOM | 5 |
      | A5 |            | 4 |
      | A5 |            | 1 |
    Then there is no link displayed
    #8. Collapse parent  A1
    When user collapse parent recursively on node "1"
    Then the label of all nodes is displayed as following
      | A2 |            |   |
      | A1 | TOP,BOTTOM | 0 |
      | A4 |            | 1 |
      | A5 |            | 1 |
    Then there is no link displayed
    #9. Collapse children  A1
    When user collapse children recursively on node "1"
    Then the label of all nodes is displayed as following
      | A2 |            |   |
      | A1 | TOP,BOTTOM | 0 |
      | A4 |            | 1 |
    Then there is no link displayed

  Scenario: Data_154 - Check displayed correctly container relationship of nodes (that have many incoming/outgoing nodes-n level on same table) when was started by it then Expand all levels
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_154"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_154"
    Then the graph should be displayed
    #5. Expand parent of A1
    When user expands parent on node "0"
    #6. Expand parent of A2
    When user expands parent on node "1"
    #7. Expand parent of A3
    When user expands parent on node "5"
    #8. Expand parent of An-1
    When user expands parent on node "8"
    When user expands parent on node "11"
    When user expands parent on node "15"
    When user expands parent on node "21"
    When user expands parent on node "31"
    When user expands parent on node "38"
    When user expands parent on node "54"
    When user expands parent on node "59"
    When user expands parent on node "71"
    When user expands parent on node "89"
    When user expands parent on node "100"
    When user expands parent on node "116"
    When user expands parent on node "127"
    When user expands parent on node "146"
    When user expands parent on node "162"
    When user expands parent on node "178"
    Then the label of all nodes is displayed as following
      | A6  | TOP | 191 |
      | A3  | TOP | 193 |
      | A14 | TOP | 195 |
      | A13 | TOP | 194 |
      | A5  | TOP | 190 |
      | A4  | TOP | 197 |
      | A19 | TOP | 199 |
      | A1  | TOP | 201 |
      | A10 | TOP | 203 |
      | A16 | TOP | 205 |
      | A9  | TOP | 202 |
      | A8  | TOP | 206 |
      | A17 | TOP | 208 |
      | A12 | TOP | 196 |
      | A7  | TOP | 207 |
      | A18 | TOP | 198 |
      | A11 | TOP | 209 |
      | A20 |     |     |
      | A15 | TOP | 204 |
      | A2  | TOP | 192 |
    Then there is no link displayed
    #9. Collapse parent of A1
    When user collapse parent on node "200"
    Then the label of all nodes is displayed as following
      | A1 | TOP |  |
    #10. Expand parent of A1
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      | A2 | TOP |   |
      | A1 | TOP | 1 |
    #11. Repeated step 5->9 with recursively service
    When user expands parent recursively on node "1"
    When user expands parent recursively on node "21"
    When user expands parent recursively on node "71"
    When user expands parent recursively on node "146"
    Then the label of all nodes is displayed as following
      | A6  | TOP | 191 |
      | A3  | TOP | 193 |
      | A14 | TOP | 195 |
      | A13 | TOP | 194 |
      | A5  | TOP | 190 |
      | A4  | TOP | 197 |
      | A19 | TOP | 199 |
      | A1  | TOP | 201 |
      | A10 | TOP | 203 |
      | A16 | TOP | 205 |
      | A9  | TOP | 202 |
      | A8  | TOP | 206 |
      | A17 | TOP | 208 |
      | A12 | TOP | 196 |
      | A7  | TOP | 207 |
      | A18 | TOP | 198 |
      | A11 | TOP | 209 |
      | A20 |     |     |
      | A15 | TOP | 204 |
      | A2  | TOP | 192 |
    Then there is no link displayed

  Scenario: Data_155 - Check displayed correctly container relationship of nodes (that have many incoming/outgoing nodes-n level on same table) when was started by it then Expand all levels and Collapse by any node.
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_154"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_154"
    Then the graph should be displayed
    #5. Expand parent of A1
    When user expands parent on node "0"
    #6. Expand parent of A2
    When user expands parent on node "1"
    #7. Expand parent of A3
    When user expands parent on node "5"
    #8. Expand parent of An-1
    When user expands parent on node "8"
    When user expands parent on node "11"
    When user expands parent on node "15"
    When user expands parent on node "21"
    When user expands parent on node "31"
    When user expands parent on node "38"
    When user expands parent on node "54"
    When user expands parent on node "59"
    When user expands parent on node "71"
    When user expands parent on node "89"
    When user expands parent on node "100"
    When user expands parent on node "116"
    When user expands parent on node "127"
    When user expands parent on node "146"
    When user expands parent on node "162"
    When user expands parent on node "178"
    Then the label of all nodes is displayed as following
      | A6  | TOP | 191 |
      | A3  | TOP | 193 |
      | A14 | TOP | 195 |
      | A13 | TOP | 194 |
      | A5  | TOP | 190 |
      | A4  | TOP | 197 |
      | A19 | TOP | 199 |
      | A1  | TOP | 201 |
      | A10 | TOP | 203 |
      | A16 | TOP | 205 |
      | A9  | TOP | 202 |
      | A8  | TOP | 206 |
      | A17 | TOP | 208 |
      | A12 | TOP | 196 |
      | A7  | TOP | 207 |
      | A18 | TOP | 198 |
      | A11 | TOP | 209 |
      | A20 |     |     |
      | A15 | TOP | 204 |
      | A2  | TOP | 192 |
    Then there is no link displayed
    #9. Collapse parent of A10
    When user collapse parent on node "202"
    Then the label of all nodes is displayed as following
      | A8  | TOP | 46 |
      | A4  | TOP | 48 |
      | A3  | TOP | 47 |
      | A5  | TOP | 50 |
      | A1  | TOP | 52 |
      | A7  | TOP | 45 |
      | A6  | TOP | 53 |
      | A2  | TOP | 49 |
      | A10 | TOP |    |
      | A9  | TOP | 54 |
    #10. Collapse parent of A1
    When user collapse parent on node "51"
    Then the label of all nodes is displayed as following
      | A1 | TOP |  |
    #11. Expand parent of A1
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      | A2 | TOP |   |
      | A1 | TOP | 1 |
    #12. Repeated step 5->9 with recursively service
    When user expands parent recursively on node "1"
    When user expands parent recursively on node "21"
    When user expands parent recursively on node "71"
    When user expands parent recursively on node "146"
    Then the label of all nodes is displayed as following
      | A6  | TOP | 191 |
      | A3  | TOP | 193 |
      | A14 | TOP | 195 |
      | A13 | TOP | 194 |
      | A5  | TOP | 190 |
      | A4  | TOP | 197 |
      | A19 | TOP | 199 |
      | A1  | TOP | 201 |
      | A10 | TOP | 203 |
      | A16 | TOP | 205 |
      | A9  | TOP | 202 |
      | A8  | TOP | 206 |
      | A17 | TOP | 208 |
      | A12 | TOP | 196 |
      | A7  | TOP | 207 |
      | A18 | TOP | 198 |
      | A11 | TOP | 209 |
      | A20 |     |     |
      | A15 | TOP | 204 |
      | A2  | TOP | 192 |
    Then there is no link displayed

  Scenario: Data_156 - Check displayed correctly container relationship of nodes (that have many incoming/outgoing nodes-n level on same table) when was started by it and outgoing nodes then Expand/Collapse them
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_154"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
      | A1 |
      | A2 |
    And user generates graph with configuration "Data_154"
    Then the graph should be displayed
    #5. Expand parent of A2
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      | A1 |     | 3 |
      | A3 | TOP |   |
      | A2 | TOP | 4 |
    Then there is no link displayed
    #6. Expand parent of A3
    When user expands parent on node "4"
    Then the label of all nodes is displayed as following
      | A1 |     | 6 |
      | A4 | TOP |   |
      | A3 | TOP | 7 |
      | A2 | TOP | 8 |
    Then there is no link displayed
    #8. Collapse parent of A2
    When user collapse parent on node "6"
    Then the label of all nodes is displayed as following
      | A2 | TOP |   |
      | A1 |     | 0 |
    Then there is no link displayed
    #9. Expand parent of A2
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      | A1 |     | 3 |
      | A3 | TOP |   |
      | A2 | TOP | 4 |
    Then there is no link displayed
    #11. Repeated step 5->9 with recursively service
    #6. Expand parent of A3
    When user expands parent recursively on node "4"
    Then the label of all nodes is displayed as following
      | A5 | TOP | 10 |
      | A7 | TOP | 12 |
      | A8 | TOP |    |
      | A6 | TOP | 11 |
      | A1 |     | 14 |
      | A4 | TOP |  9 |
      | A3 | TOP | 15 |
      | A2 | TOP | 16 |
    Then there is no link displayed
    #8. Collapse parent of A2
    When user collapse parent recursively on node "14"
    Then the label of all nodes is displayed as following
      | A2 | TOP |   |
      | A1 |     | 0 |
    Then there is no link displayed

  Scenario: Data_157 - Check displayed correctly container relationship of nodes (that have many incoming/outgoing nodes-n level on same table) when was started all nodes then Expand/Collapse any node
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_154"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
      | A1  |
      | A2  |
      | A3  |
      | A4  |
      | A5  |
      | A6  |
      | A7  |
      | A8  |
      | A9  |
      | A10 |
      | A11 |
      | A12 |
      | A13 |
      | A14 |
      | A15 |
      | A16 |
      | A17 |
      | A18 |
      | A19 |
      | A20 |
    And user generates graph with configuration "Data_154"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      | A6  |  |  1 |
      | A3  |  |  3 |
      | A14 |  |  5 |
      | A13 |  |  4 |
      | A5  |  |  0 |
      | A4  |  |  7 |
      | A19 |  |  9 |
      | A1  |  | 11 |
      | A10 |  | 13 |
      | A16 |  | 15 |
      | A9  |  | 12 |
      | A8  |  | 16 |
      | A17 |  | 18 |
      | A12 |  |  6 |
      | A7  |  | 17 |
      | A18 |  |  8 |
      | A11 |  | 19 |
      | A20 |  |    |
      | A15 |  | 14 |
      | A2  |  |  2 |
    Then there is no link displayed

  Scenario: Data_158 - Check displayed correctly container relationship of nodes (that have many incoming/outgoing nodes-n level on same table) when was started by node at last level then Expand all levels and Collapse by start node.
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_154"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A20"
    And user generates graph with configuration "Data_154"
    Then the graph should be displayed
    #5. Expand children of A20
    When user expands children on node "0"
    #6. Expand parent of A19
    When user expands children on node "1"
    #7. Expand parent of A18
    When user expands children on node "2"
    #8. Expand parent of An-1
    When user expands children on node "3"
    When user expands children on node "4"
    When user expands children on node "5"
    When user expands children on node "6"
    When user expands children on node "7"
    When user expands children on node "8"
    When user expands children on node "9"
    When user expands children on node "10"
    When user expands children on node "11"
    When user expands children on node "12"
    When user expands children on node "13"
    When user expands children on node "14"
    When user expands children on node "15"
    When user expands children on node "16"
    When user expands children on node "17"
    When user expands children on node "18"
    Then the label of all nodes is displayed as following
      | A20 | BOTTOM |    |
      | A19 | BOTTOM |  0 |
      | A18 | BOTTOM |  1 |
      | A17 | BOTTOM |  2 |
      | A16 | BOTTOM |  3 |
      | A15 | BOTTOM |  4 |
      | A14 | BOTTOM |  5 |
      | A13 | BOTTOM |  6 |
      | A12 | BOTTOM |  7 |
      | A11 | BOTTOM |  8 |
      | A10 | BOTTOM |  9 |
      | A9  | BOTTOM | 10 |
      | A8  | BOTTOM | 11 |
      | A7  | BOTTOM | 12 |
      | A6  | BOTTOM | 13 |
      | A5  | BOTTOM | 14 |
      | A4  | BOTTOM | 15 |
      | A3  | BOTTOM | 16 |
      | A2  | BOTTOM | 17 |
      | A1  |        | 18 |
    Then there is no link displayed
    #9. Collapse children of A1
    When user collapse children on node "0"
    Then the label of all nodes is displayed as following
      | A20 | BOTTOM |  |
    #10. Expand parent of A1
    When user expands children on node "0"
    Then the label of all nodes is displayed as following
      | A20 | BOTTOM |   |
      | A19 | BOTTOM | 0 |
    #11. Repeated step 6->9 with recursively service(if have)
    When user expands children recursively on node "1"
    When user expands children recursively on node "6"
    When user expands children recursively on node "11"
    When user expands children recursively on node "16"
    Then the label of all nodes is displayed as following
      | A20 | BOTTOM |    |
      | A19 | BOTTOM |  0 |
      | A18 | BOTTOM |  1 |
      | A17 | BOTTOM |  2 |
      | A16 | BOTTOM |  3 |
      | A15 | BOTTOM |  4 |
      | A14 | BOTTOM |  5 |
      | A13 | BOTTOM |  6 |
      | A12 | BOTTOM |  7 |
      | A11 | BOTTOM |  8 |
      | A10 | BOTTOM |  9 |
      | A9  | BOTTOM | 10 |
      | A8  | BOTTOM | 11 |
      | A7  | BOTTOM | 12 |
      | A6  | BOTTOM | 13 |
      | A5  | BOTTOM | 14 |
      | A4  | BOTTOM | 15 |
      | A3  | BOTTOM | 16 |
      | A2  | BOTTOM | 17 |
      | A1  |        | 18 |
    Then there is no link displayed

  Scenario: Data_167 -Failed- Check displayed correctly container relationship of nodes (it have same outgoing and incoming nodes(n level) on same table) when starting by incoming node and expand&collapse them and render nodes after that
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_167"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_167"
    Then the graph should be displayed
    #5. Expand parent of A1
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      | A2 | TOP | 2 |
      | A1 | TOP | 2 |
      | A1 | TOP | 1 |
      | A3 | TOP |   |
    Then there is no link displayed
    #6. Expand parent of A2
    When user expands parent on node "1"
    Then the label of all nodes is displayed as following
      | A1 | TOP |  6 |
      | A1 | TOP |  8 |
      | A5 |     |    |
      | A1 | TOP | 11 |
      | A4 |     |    |
      | A2 | TOP |  9 |
      | A3 |     |  9 |
      | A2 | TOP | 12 |
      | A1 | TOP | 13 |
      | A2 | TOP | 13 |
    Then there is no link displayed
    #7. Expand parent of A3
    When user expands parent on node "13"
    Then the label of all nodes is displayed as following
      | A1 | TOP |  6 |
      | A1 | TOP |  8 |
      | A5 |     |    |
      | A1 | TOP | 11 |
      | A4 |     |    |
      | A2 | TOP |  9 |
      | A3 |     |  9 |
      | A2 | TOP | 12 |
      | A1 | TOP | 13 |
      | A2 | TOP | 13 |
    Then there is no link displayed
    #8. Collapse A2
    When user collapse parent on node "11"
    Then the label of all nodes is displayed as following
      | A2 | TOP | 2 |
      | A1 | TOP | 2 |
      | A1 | TOP | 1 |
      | A3 | TOP |   |
    Then there is no link displayed
    #9. Expand recursively service of A2
    When user expands parent recursively on node "1"
    Then the label of all nodes is displayed as following
      | A1 | TOP |  6 |
      | A1 | TOP |  8 |
      | A5 |     |    |
      | A1 | TOP | 11 |
      | A4 |     |    |
      | A2 | TOP |  9 |
      | A3 |     |  9 |
      | A2 | TOP | 12 |
      | A1 | TOP | 13 |
      | A2 | TOP | 13 |
    Then there is no link displayed

  #Failed
  Scenario: Data_168 - Check displayed correctly container  relationship of nodes (it have same outgoing and incoming nodes(n level) on same table) when starting by outgoing node
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_167"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A3"
    And user generates graph with configuration "Data_167"
    Then the graph should be displayed
    #5. Expand children of A3
    When user expands children on node "0"
    Then the label of all nodes is displayed as following
      | A3 | TOP,BOTTOM |   |
      | A2 | TOP        | 0 |
      | A1 |            | 0 |
      | A1 |            | 1 |
    Then there is no link displayed
    #6. Expand parent of A3
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      | A1 |            | 5 |
      | A1 |            | 7 |
      | A5 |            |   |
      | A2 | TOP        | 8 |
      | A3 | TOP,BOTTOM | 8 |
      | A1 |            | 9 |
      | A2 | TOP        | 9 |
    Then there is no link displayed
    #7. Expand parent of A2
    When user expands parent on node "5"
    Then the label of all nodes is displayed as following
      | A1 |            |  5 |
      | A1 |            |  7 |
      | A5 |            |    |
      | A2 | TOP        |  8 |
      | A3 | TOP,BOTTOM |  8 |
      | A1 |            |  9 |
      | A2 |            |  9 |
      | A1 |            | 12 |
      | A4 |            |    |
      | A2 | TOP        | 13 |
    Then there is no link displayed
    #8. Collapse parent A3
    When user collapse parent on node "9"
    Then the label of all nodes is displayed as following
      | A1 |            | 12 |
      | A4 |            |    |
      | A2 | TOP        | 13 |
      | A2 | TOP        |  0 |
      | A1 |            |  0 |
      | A1 |            |  1 |
      | A3 | TOP,BOTTOM |    |
    Then there is no link displayed

  Scenario: Data_168.1 -Failed- Check displayed correctly container  relationship of nodes (it have same outgoing and incoming nodes(n level) on same table) when starting by outgoing node and expand recursively
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_167"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A3"
    And user generates graph with configuration "Data_167"
    Then the graph should be displayed
    #5. Expand children recursively of A3
    When user expands children recursively on node "0"
    Then the label of all nodes is displayed as following
      | A3 | TOP,BOTTOM |   |
      | A2 | TOP        | 0 |
      | A1 |            | 0 |
      | A1 |            | 1 |
    Then there is no link displayed

  #Failed
  Scenario: Data_168.2 -Failed- Check displayed correctly container  relationship of nodes (it have same outgoing and incoming nodes(n level) on same table) when starting by outgoing node and changed owner node after that to expand/collapse
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_167"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A3"
    And user generates graph with configuration "Data_167"
    Then the graph should be displayed
    #5. Expand children of A3
    When user expands children on node "0"
    Then the label of all nodes is displayed as following
      | A3 | TOP,BOTTOM |   |
      | A2 | TOP        | 0 |
      | A1 |            | 0 |
      | A1 |            | 1 |
    Then there is no link displayed
    #6. Expand parent of A3
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      | A1 |            | 5 |
      | A1 |            | 7 |
      | A5 |            |   |
      | A2 | TOP        | 8 |
      | A3 | TOP,BOTTOM | 8 |
      | A1 |            | 9 |
      | A2 | TOP        | 9 |
    Then there is no link displayed
    #7. Collapse children A3
    When user collapse children on node "9"
    Then the label of all nodes is displayed as following
      | A5 | BOTTOM     |   |
      | A3 | TOP,BOTTOM | 8 |
    Then there is no link displayed
    #8. Expand children of A5
    When user expands children on node "8"
    Then the label of all nodes is displayed as following
      | A5 | BOTTOM     |   |
      | A3 | TOP,BOTTOM | 8 |
      | A2 | TOP,BOTTOM | 8 |
      | A2 | TOP,BOTTOM | 9 |
    Then there is no link displayed
    #9. Expand parent of A2
    When user expands parent on node "7"
    Then the label of all nodes is displayed as following
      | A5 | BOTTOM     |    |
      | A3 | TOP,BOTTOM |  8 |
      | A2 | BOTTOM     |  8 |
      | A2 | TOP,BOTTOM |  9 |
      | A4 |            |    |
      | A2 | TOP,BOTTOM | 11 |
    Then there is no link displayed
    #10. Expand children of A2
    When user expands children on node "7"
    Then the label of all nodes is displayed as following
      | A5 | BOTTOM     |    |
      | A3 | TOP        |  8 |
      | A2 | BOTTOM     |  8 |
      | A2 | TOP,BOTTOM |  9 |
      | A4 |            |    |
      | A2 | TOP,BOTTOM | 11 |
      | A1 |            |  5 |
      | A1 |            |  7 |
      | A1 |            | 12 |
      | A1 |            |  9 |
    Then there is no link displayed
    #11. Collapse children A5
    When user collapse children on node "8"
    Then the label of all nodes is displayed as following
      | A5 | BOTTOM     |   |
      | A3 | TOP,BOTTOM | 8 |
    Then there is no link displayed

  #Failed
  Scenario: Data_169 -Failed- Check displayed correctly container relationship of nodes (it have same outgoing and incoming nodes(n level) on same table) when starting by incoming node and collapse/expand recursively them
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_169"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_169"
    Then the graph should be displayed
    #5. Expand parent of A1
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      | A1 | TOP | 2 |
      | A2 | TOP | 3 |
      | A1 | TOP | 3 |
      | A3 | TOP |   |
    Then there is no link displayed
    #6. Expand parent of A2
    When user expands parent on node "2"
    Then the label of all nodes is displayed as following
      | A2 | TOP |  6 |
      | A1 | TOP |  8 |
      | A1 | TOP |  5 |
      | A3 |     |  6 |
      | A1 | TOP | 10 |
      | A2 | TOP | 10 |
      | A4 | TOP |    |
    Then there is no link displayed
    #7. Expand parent of A4
    When user expands parent on node "6"
    Then the label of all nodes is displayed as following
      | A2 | TOP | 13 |
      | A1 | TOP | 15 |
      | A4 | TOP | 16 |
      | A5 |     |    |
      | A1 | TOP | 12 |
      | A1 | TOP | 19 |
      | A2 | TOP | 19 |
      | A3 |     | 13 |
    Then there is no link displayed
    #8. Collapse parent A2
    When user collapse parent on node "12"
    Then the label of all nodes is displayed as following
      | A1 | TOP | 2 |
      | A2 | TOP | 3 |
      | A1 | TOP | 3 |
      | A3 | TOP |   |
    Then there is no link displayed
    #9. Expand parent recursively of A2
    When user expands parent recursively on node "1"
    Then the label of all nodes is displayed as following
      | A2 | TOP | 13 |
      | A1 | TOP | 15 |
      | A4 | TOP | 16 |
      | A5 |     |    |
      | A1 | TOP | 12 |
      | A1 | TOP | 19 |
      | A2 | TOP | 19 |
      | A3 |     | 13 |
    Then there is no link displayed

  Scenario: Data_170 - Check displayed correctly container relationship of nodes (it have same outgoing and incoming nodes(n level) on same table) when starting by incoming node and expand&collapse them and render nodes after that
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_169"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_169"
    Then the graph should be displayed
    #5. Expand parent of A1
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      | A1 | TOP | 2 |
      | A2 | TOP | 3 |
      | A1 | TOP | 3 |
      | A3 | TOP |   |
    Then there is no link displayed
    #6. Expand parent of A2
    When user expands parent on node "2"
    Then the label of all nodes is displayed as following
      | A2 | TOP |  6 |
      | A1 | TOP |  8 |
      | A1 | TOP |  5 |
      | A3 |     |  6 |
      | A1 | TOP | 10 |
      | A2 | TOP | 10 |
      | A4 | TOP |    |
    Then there is no link displayed
    #7. Expand parent of A4
    When user expands parent on node "6"
    Then the label of all nodes is displayed as following
      | A2 | TOP | 13 |
      | A1 | TOP | 15 |
      | A4 | TOP | 16 |
      | A5 |     |    |
      | A1 | TOP | 12 |
      | A1 | TOP | 19 |
      | A2 | TOP | 19 |
      | A3 |     | 13 |
    Then there is no link displayed
    #8. Collapse parent A2
    When user collapse parent on node "12"
    Then the label of all nodes is displayed as following
      | A1 | TOP | 2 |
      | A2 | TOP | 3 |
      | A1 | TOP | 3 |
      | A3 | TOP |   |
    Then there is no link displayed
    #9. Expand parent recursively of A2
    When user expands parent recursively on node "3"
    Then the label of all nodes is displayed as following
      | A2 |     | 13 |
      | A1 | TOP | 15 |
      | A4 | TOP | 16 |
      | A5 |     |    |
      | A1 | TOP | 12 |
      | A1 | TOP | 19 |
      | A2 |     | 19 |
      | A3 | TOP | 13 |
    Then there is no link displayed

  #Failed
  Scenario: Data_171 -Failed- Check displayed correctly container relationship of nodes (it have same outgoing and incoming nodes(n level) on same table) when starting by incoming node and expand&collapse them and render nodes after that
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_171"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_171"
    Then the graph should be displayed
    #5. Expand parent of A1
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      | A1 | TOP | 2 |
      | A3 |     | 2 |
      | A1 | TOP | 5 |
      | A6 | TOP |   |
      | A2 | TOP | 5 |
      | A1 | TOP | 3 |
    Then there is no link displayed
    #6. Expand parent of A2
    When user expands parent on node "2"
    Then the label of all nodes is displayed as following
      | A3 |     |  8 |
      | A6 |     | 10 |
      | A1 | TOP |  8 |
      | A4 |     | 12 |
      | A2 | TOP | 10 |
      | A5 |     |    |
      | A6 |     | 12 |
      | A3 |     | 16 |
      | A1 | TOP | 15 |
      | A1 | TOP | 16 |
      | A1 | TOP |  7 |
      | A1 | TOP | 14 |
      | A2 | TOP |  9 |
      | A1 | TOP | 21 |
      | A1 | TOP | 24 |
      | A2 | TOP | 14 |
      | A1 | TOP |  9 |
      | A2 | TOP | 12 |
      | A1 | TOP | 13 |
      | A3 |     | 21 |
      | A3 |     | 13 |
      | A1 | TOP | 27 |
    Then there is no link displayed
    #11. Collapse parent A1
    When user collapse parent on node "17"
    Then the label of all nodes is displayed as following
      | A1 | TOP |  |
    Then there is no link displayed
    #12. Expand parent of A1
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      | A1 | TOP | 2 |
      | A3 |     | 2 |
      | A1 | TOP | 5 |
      | A6 | TOP |   |
      | A2 | TOP | 5 |
      | A1 | TOP | 3 |
    Then there is no link displayed
    #13. Expand parent recursively of A2
    When user expands parent recursively on node "3"
    Then the label of all nodes is displayed as following
      | A3 |     |  8 |
      | A6 |     | 10 |
      | A1 | TOP |  8 |
      | A4 |     | 12 |
      | A2 | TOP | 10 |
      | A5 |     |    |
      | A6 |     | 12 |
      | A3 |     | 16 |
      | A1 | TOP | 15 |
      | A1 | TOP | 16 |
      | A1 | TOP |  7 |
      | A1 | TOP | 14 |
      | A2 | TOP |  9 |
      | A1 | TOP | 21 |
      | A1 | TOP | 24 |
      | A2 | TOP | 14 |
      | A1 | TOP |  9 |
      | A2 | TOP | 12 |
      | A1 | TOP | 13 |
      | A3 |     | 21 |
      | A3 |     | 13 |
      | A1 | TOP | 27 |
    Then there is no link displayed

  #Failed
  Scenario: Data_172 -Failed- Check displayed correctly container relationship of nodes (it have same many outgoing&incoming nodes(n level) on same table by FKs) when starting by incoming node and expand&collapse them and render nodes after that
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_172"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of record has ID is "A1"
    And user generates graph with configuration "Data_172"
    Then the graph should be displayed
    #5. Expand parent of A1
    When user expands parent on node "0"
    Then the label of all nodes is displayed as following
      | A3 |     | 2 |
      | A6 | TOP |   |
      | A2 | TOP | 3 |
      | A1 | TOP | 3 |
      | A1 | TOP | 1 |
      | A1 | TOP | 2 |
    Then there is no link displayed
    #6. Expand parent of A2
    When user expands parent on node "2"
    Then the label of all nodes is displayed as following
      | A1 | TOP |  8 |
      | A2 | TOP | 10 |
      | A1 | TOP | 10 |
      | A2 | TOP |  8 |
      | A1 | TOP | 12 |
      | A1 | TOP | 15 |
      | A3 |     | 15 |
      | A3 |     | 12 |
      | A1 | TOP |  9 |
      | A4 |     | 20 |
      | A1 | TOP | 16 |
      | A2 | TOP | 20 |
      | A1 | TOP | 24 |
      | A5 |     |    |
      | A6 |     | 19 |
      | A6 |     | 20 |
      | A2 | TOP | 19 |
      | A3 |     | 22 |
      | A1 | TOP | 17 |
      | A1 | TOP | 22 |
      | A1 | TOP | 25 |
      | A3 |     |  9 |
    Then there is no link displayed
    #11. Collapse parent A2
    When user collapse parent on node "9"
    Then the label of all nodes is displayed as following
      | A3 |     | 2 |
      | A6 | TOP |   |
      | A2 | TOP | 3 |
      | A1 | TOP | 3 |
      | A1 | TOP | 1 |
      | A1 | TOP | 2 |
    Then there is no link displayed
    #12. Expand parent recursively of A6
    When user expands parent recursively on node "3"
    Then the label of all nodes is displayed as following
      | A1 | TOP |  8 |
      | A2 |     | 10 |
      | A1 | TOP | 10 |
      | A2 |     |  8 |
      | A1 | TOP | 12 |
      | A1 | TOP | 15 |
      | A3 |     | 15 |
      | A3 |     | 12 |
      | A1 | TOP |  9 |
      | A4 |     | 20 |
      | A1 | TOP | 16 |
      | A2 |     | 20 |
      | A1 | TOP | 24 |
      | A5 |     |    |
      | A6 | TOP | 19 |
      | A6 | TOP | 20 |
      | A2 |     | 19 |
      | A3 |     | 22 |
      | A1 | TOP | 17 |
      | A1 | TOP | 22 |
      | A1 | TOP | 25 |
      | A3 |     |  9 |
    Then there is no link displayed

  Scenario: Data_173 - Check displayed correctly container relationship of nodes (it have same many outgoing&incoming nodes(n level) on same table by FKs) when starting by incoming node and expand&collapse them and render nodes after that
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_173"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
      | A1 |
      | A2 |
    And user generates graph with configuration "Data_173"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      | A2 | BOTTOM | 1 |
      | A1 | BOTTOM |   |
    Then there is no link displayed
    #5. Expand children of A1
    When user expands children on node "1"
    Then the label of all nodes is displayed as following
      | A2 | BOTTOM | 1 |
      | A1 | BOTTOM |   |
      | B1 |        | 1 |
    Then there is no link displayed
    #6. Expand children of A2
    When user expands children on node "0"
    Then the label of all nodes is displayed as following
      | A2 | BOTTOM | 1 |
      | A1 | BOTTOM |   |
      | B1 |        | 1 |
      | C1 |        | 0 |
    Then there is no link displayed
    #7. Collapse children A1
    When user collapse children on node "1"
    Then the label of all nodes is displayed as following
      | A2 | BOTTOM | 1 |
      | A1 | BOTTOM |   |
    Then there is no link displayed
    #8. Expand children recursively of A1
    When user expands children recursively on node "1"
    Then the label of all nodes is displayed as following
      | A2 | BOTTOM | 1 |
      | A1 | BOTTOM |   |
      | B1 |        | 1 |
      | C1 |        | 0 |
    Then there is no link displayed

  Scenario: Data_173.1 - Check displayed correctly container relationship of nodes (it have same many outgoing&incoming nodes(n level) on same table by FKs) when starting by incoming node and expand&collapse them and render nodes after that
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_173"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
      | A1 |
      | A2 |
    And user generates graph with configuration "Data_173.1"
    Then the graph should be displayed
    Then the label of all nodes is displayed as following
      | A2 | TOP | 1 |
      | A1 | TOP |   |
    Then there is no link displayed
    #5. Expand parent of A1
    When user expands parent on node "1"
    Then the label of all nodes is displayed as following
      | B1 |     |   |
      | A2 | TOP | 3 |
      | A1 | TOP | 2 |
    Then there is no link displayed
    #6. Expand parent of A2
    When user expands parent on node "4"
    Then the label of all nodes is displayed as following
      | B1 |     |   |
      | A1 | TOP | 2 |
      | A2 | TOP | 3 |
      | A2 | TOP | 6 |
      | C1 |     |   |
    Then there is no link displayed
    #7. Collapse parent A1
    When user collapse parent on node "3"
    Then the label of all nodes is displayed as following
      | A2 | TOP | 6 |
      | C1 |     |   |
      | A2 | TOP | 1 |
      | A1 | TOP |   |
    Then there is no link displayed
    #8. Expand parent recursively of A1
    When user expands parent recursively on node "1"
    Then the label of all nodes is displayed as following
      | B1 |     |   |
      | A1 | TOP | 2 |
      | A2 | TOP | 3 |
      | A2 | TOP | 6 |
      | C1 |     |   |
    Then there is no link displayed

  Scenario: Data_174 - Check expand & collapse node for a starting node when it have many incoming & outgoing node from external table (Same TableName, Same Data Model SameSpace, #DataSet)
    Given I access dataspace "Master Data - Reference>DMDV_v1.0.0"
    Given I access dataset "Data_174"
    And I access table "TableA"
    And user views "Visualization>Display data using configuration" of records have ID are
      | A1 |
    And user generates graph with configuration "Data_174"
    Then the graph should be displayed
    #5. Expand target of A1
    When user expands target on node "0"
    Then the label of all nodes is displayed as following
      | A1  | RIGHT      |  |
      | A'3 |            |  |
      | A'2 | LEFT,RIGHT |  |
      | A'1 |            |  |
    Then the label of link label should be display as following
      | 0 | 3 |  |
      | 0 | 1 |  |
      | 0 | 2 |  |
    #6. Expand source of A'2
    When user expands source on node "2"
    Then the label of all nodes is displayed as following
      | A1  | RIGHT      |  |
      | A'3 |            |  |
      | A'2 | LEFT,RIGHT |  |
      | A'1 |            |  |
      | A2  |            |  |
    Then the label of link label should be display as following
      | 0 | 3 |  |
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 4 | 2 |  |
    #7. Collapse target A1
    When user collapse target on node "0"
    Then the label of all nodes is displayed as following
      | A1 | RIGHT |  |
    Then there is no link displayed
    #8. Expand target recursively of A1
    When user expands target recursively on node "0"
    Then the label of all nodes is displayed as following
      | A1  | RIGHT      |  |
      | A'3 |            |  |
      | A'2 | LEFT,RIGHT |  |
      | A'1 |            |  |
    Then the label of link label should be display as following
      | 0 | 3 |  |
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 2 | 2 |  |
    #9. Expand source recursively of A'2
    When user expands source recursively on node "2"
    Then the label of all nodes is displayed as following
      | A1  | RIGHT      |  |
      | A'3 |            |  |
      | A'2 | LEFT,RIGHT |  |
      | A'1 |            |  |
      | A2  |            |  |
    Then the label of link label should be display as following
      | 0 | 3 |  |
      | 0 | 1 |  |
      | 0 | 2 |  |
      | 4 | 2 |  |
      | 2 | 2 |  |
