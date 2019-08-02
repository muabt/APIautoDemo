@DMDV100-GraphModel
Feature: Test graph data with configuration
  Background: 
    Given I login to EBX succesfully
    
Scenario: GenM_05 - Check Generated successfully with correct DataModel when no have configuration model (Fastrack model)
    Given I access dataspace "Master Data - Reference"
    Given I access dataset "Burgers"
    And user views data model graph
    Then the graph should be displayed
    Then the graph model should contains following tables and groups
			| Product Lines | |
			| Products | |
			| Ingredients | |
			| Menus | |
			| Technical data | |
			| Products - Product Lines |Technical data |
			| Ingredients - Products |Technical data |
			| Ingredient - Ingredient |Technical data |
			| Products - Menus |Technical data |
		Then the graph model should contains following fields
			| id:Integer |Product Lines |
			| name:String |Product Lines |
			| products:Products |Product Lines |
			| id:Integer |Products |
			| main |Products |
			| product lines:Product Lines |Products |
			| nutrition facts |Products |
			| ingredients:Ingredients |Products |
			| id:Integer |Ingredients |
			| name:String |Ingredients |
			| allergy warning:String |Ingredients |
			| note:Text |Ingredients |
			| minor ingredient:Text |Ingredients |
			| child ingredients:Ingredients |Ingredients |
			| parent ingredients:Ingredients |Ingredients |
			| products:Products |Ingredients |
			| id:Integer |Menus |
			| name:String |Menus |
			| start date:Date |Menus |
			| end date:Date |Menus |
			| products:Products |Menus |
			| name:String |Products |
			| description:Text |Products |
			| supplier:String |Products |
			| serving size:String |Products |
			| calories:Integer |Products |
			| calories from fat:Integer |Products |
			| total fat (g):Integer |Products |
			| saturated fat (g):Integer |Products |
			| trans fat (g):Integer |Products |
			| cholesterol (mg):Integer |Products |
			| sodium (mg):Integer |Products |
			| carbohydrates (g):Integer |Products |
			| dietary fiber (g):Integer |Products |
			| sugars (g):Integer |Products |
			| protein (g):Integer |Products |
			| vitamin a % daily value:Integer |Products |
			| vitamin c % daily value:Integer |Products |
			| calcium % daily value:Integer |Products |
			| iron % daily value:Integer |Products |
			| product line:Product Lines |Products - Product Lines |
			| product:Products |Products - Product Lines |
			| product:Products |Ingredients - Products |
			| ingredient:Ingredients |Ingredients - Products |
			| parent:Ingredients |Ingredient - Ingredient |
			| child:Ingredients |Ingredient - Ingredient |
			| menu:Menus |Products - Menus |
			| product:Products |Products - Menus |
    Then the graph model should contains following links
			|Products - Product Lines |Product Lines |product line | |1 |
			|Products - Product Lines |Products |product | |1 |
			|Ingredients - Products |Products |product | |1 |
			|Ingredients - Products |Ingredients |ingredient | |1 |
			|Ingredient - Ingredient |Ingredients |parent | |1 |
			|Ingredient - Ingredient |Ingredients |child | |1 |
			|Products - Menus |Menus |menu | |1 |
			|Products - Menus |Products |product | |1 |