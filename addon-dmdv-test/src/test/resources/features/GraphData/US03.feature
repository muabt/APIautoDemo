@DMDV110-US03-Language
Feature: US03-Dynamic labels for nodes

  Background: 
    Given I login to EBX succesfully

  Scenario Outline: Check that label node with multi language.
    Given user change language to "<language-name>"
    Given I access dataspace "Master Data - Reference>DMDV1.1.0"
    Given I access dataset "US03"
    And I access table "TableA"
    And user views "Visualization>Display values and relationships" of record has ID is "1"
    And user generates graph with configuration "<configuration-name>"
    Then the graph should be displayed
    Then the label of node "0" equal "<label>"

    Examples: 
      | language-name                             | configuration-name | label       |
      #| French (France)     | US03-19            | Nom1        |
      | Portuguese (Brazil)                       | US03-20            | das Etikett |
      | espanhol (Espanha)                        | US03-21            | rótulo      |
      | alemán (Alemania)                         | US03-22            | etiqueta    |
      | Englisch (Vereinigte Staaten von Amerika) |                    |             |
