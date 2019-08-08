@Fastrack

Feature: Generate data model graph
  As user
  I want to generate new graph from a model

  Background: 
    Given I login to EBX succesfully
    
 @APIservice
    Scenario: Generate graph model with no config
    Given I access dataspace "FastTrack>HaoTest>"
    Given I access dataset "pkTest"
    And user views data model API graph by service    
    Then the graph should be displayed
    And verify display graph template
       
   @Companyemployees
  Scenario: Generate graph model with no config
    Given I access dataspace "FastTrack>[03] Parties data>Company employees"
    Given I access dataset "Company employees"
    And user views data model graph
    Then the graph should be displayed
    And verify display graph template     
    
 @Currency.xsd
  Scenario: Generate graph model with no config
    Given I access dataspace "FastTrack>[01] Reference data>Currencies"
    Given I access dataset "Currencies (ISO 4217)"
    And user views data model graph
    Then the graph should be displayed
    And verify display graph template
    
  @Geography.xsd  
  Scenario: Generate graph model with no config
    Given I access dataspace "FastTrack>[01] Reference data>Geographies"
    Given I access dataset "Geographies (ISO 3166)"
    And user views data model graph
    Then the graph should be displayed
    And verify display graph template
 
  @USzipcodes.xsd  
  Scenario: Generate graph model with no config
    Given I access dataspace "FastTrack>[01] Reference data>Geographies"
    Given I access dataset "US Zipcodes"
    And user views data model graph
    Then the graph should be displayed
    And verify display graph template
    
  #@ICD10OrderFile.xsd   
  #Scenario: Generate graph model with no config
    #Given I access dataspace "FastTrack>[01] Reference data>ICD"
    #Given I access dataset "ICD 10 Order File"
    #And user views data model graph
    #Then the graph should be displayed
    #And verify display graph template     

  @Language.xsd  
  Scenario: Generate graph model with no config
    Given I access dataspace "FastTrack>[01] Reference data>Languages"
    Given I access dataset "Languages"
    And user views data model graph
    Then the graph should be displayed
    And verify display graph template  
    
  @MSCI-GICS.xsd   
  Scenario: Generate graph model with no config
    Given I access dataspace "FastTrack>[01] Reference data>MSCI-GICS industry codes"
    Given I access dataset "MSCI-GICS"
    And user views data model graph
    Then the graph should be displayed
    And verify display graph template      
      
  @NAICSCrosswalk.xsd 
  Scenario: Generate graph model with no config
    Given I access dataspace "FastTrack>[01] Reference data>NAICS industry codes"
    Given I access dataset "NAICS crosswalk"
    And user views data model graph
    Then the graph should be displayed
    And verify display graph template 

  #@NUCC.xsd  
  #Scenario: Generate graph model with no config
    #Given I access dataspace "FastTrack>[01] Reference data>NUCC"
    #Given I access dataset "NUCC"
    #And user views data model graph
    #Then the graph should be displayed
    #And verify display graph template     

  @ApplicationsLandscape.xsd  
  Scenario: Generate graph model with no config
    Given I access dataspace "FastTrack>[02] Data governance>Applications landscape"
    Given I access dataset "Applications landscape"
    And user views data model graph
    Then the graph should be displayed
    And verify display graph template  

  #@GDPR.xsd 
  #Scenario: Generate graph model with no config
    #Given I access dataspace "FastTrack>[02] Data governance>GDPR"
    #Given I access dataset "GDPR"
    #And user views data model graph
    #Then the graph should be displayed
    #And verify display graph template      


  #@Counterparty.xsd
  #Scenario: Generate graph model with no config
    #Given I access dataspace "FastTrack>[03] Parties data>Companies"
    #Given I access dataset "Companies"
    #And user views data model graph
    #Then the graph should be displayed
    #And verify display graph template
    #
  #@CounterpartyLandingApp1.xsd
  #Scenario: Generate graph model with no config
    #Given I access dataspace "FastTrack>[03] Parties data>Companies"
    #Given I access dataset "Landing App 1"
    #And user views data model graph
    #Then the graph should be displayed
    #And verify display graph template    

  @CompanyLandingA
  Scenario: Generate graph model with no config
    Given I access dataspace "FastTrack>[03] Parties data>Companies (Data quality)"
    Given I access dataset "Landing A (CRM)"
    And user views data model graph
    Then the graph should be displayed
    And verify display graph template 

  @CompanyLandingB
  Scenario: Generate graph model with no config
    Given I access dataspace "FastTrack>[03] Parties data>Companies (Data quality)"
    Given I access dataset "Landing B (ERP)"
    And user views data model graph
    Then the graph should be displayed
    And verify display graph template 
    
  #@ CompanyMaster
  #Scenario: Generate graph model with no config
    #Given I access dataspace "FastTrack>[03] Parties data>Companies (Data quality)"
    #Given I access dataset "Master"
    #And user views data model graph
    #Then the graph should be displayed
    #And verify display graph template 
    #
  #@CompanyRegistry
  #Scenario: Generate graph model with no config
    #Given I access dataspace "FastTrack>[03] Parties data>Companies (Data quality)"
    #Given I access dataset "Registry"
    #And user views data model graph
    #Then the graph should be displayed
    #And verify display graph template    
    
    
  @Customer.xsd
  Scenario: Generate graph model with no config
    Given I access dataspace "FastTrack>[03] Parties data>Customers (Salesforce)"
    Given I access dataset "Customers"
    And user views data model graph
    Then the graph should be displayed
    And verify display graph template  
    
  #@Executive.xsd
  #Scenario: Generate graph model with no config
    #Given I access dataspace "FastTrack>[03] Parties data>Executives"
    #Given I access dataset "Executives"
    #And user views data model graph
    #Then the graph should be displayed
    #And verify display graph template  
        
  #@LegalEntity.xsd
  #Scenario: Generate graph model with no config
    #Given I access dataspace "FastTrack>[03] Parties data>Legal entities"
    #Given I access dataset "Legal entities"
    #And user views data model graph
    #Then the graph should be displayed
    #And verify display graph template 
    
  @BurgerProduct.xsd
  Scenario: Generate graph model with no config
    Given I access dataspace "FastTrack>[04] Products data>Burgers"
    Given I access dataset "Burgers"
    And user views data model graph
    Then the graph should be displayed
    And verify display graph template          
 
  @HighTechProduct.xsd
  Scenario: Generate graph model with no config
    Given I access dataspace "FastTrack>[04] Products data>High-Tech (beta)"
    Given I access dataset "High-Tech products"
    And user views data model graph
    Then the graph should be displayed
    And verify display graph template   
    
  @usfda_ndc.xsd
  Scenario: Generate graph model with no config
    Given I access dataspace "FastTrack>[04] Products data>Pharma"
    Given I access dataset "US FDA National Drug Code Directory"
    And user views data model graph
    Then the graph should be displayed
    And verify display graph template 
    
   @PharmaProvider.xsd
  Scenario: Generate graph model with no config
    Given I access dataspace "FastTrack>[04] Products data>Pharma"
    Given I access dataset "Providers"
    And user views data model graph
    Then the graph should be displayed
    And verify display graph template    
              
  @fdaSPL.xsd
  Scenario: Generate graph model with no config
    Given I access dataspace "FastTrack>[04] Products data>Pharma"
    Given I access dataset "FDA SPL Glossary/RDM"
    And user views data model graph
    Then the graph should be displayed
    And verify display graph template 
    
  @PharmaProduct.xsd
  Scenario: Generate graph model with no config
    Given I access dataspace "FastTrack>[04] Products data>Pharma"
    Given I access dataset "Drugs @ FDA"
    And user views data model graph
    Then the graph should be displayed
    And verify display graph template         
    
  @Account.xsd
  Scenario: Generate graph model with no config
    Given I access dataspace "FastTrack>[05] Finance data>Accounts (Chart of accounts)"
    Given I access dataset "Accounts (Chart of accounts)"
    And user views data model graph
    Then the graph should be displayed
    And verify display graph template        

  #@PharmaProduct.xsd
  #Scenario: Generate graph model with no config
    #Given I access dataspace "FastTrack>[05] Finance data>Cost Centers"
    #Given I access dataset "Cost Centers"
    #And user views data model graph
    #Then the graph should be displayed
    #And verify display graph template    
 
  @CompanySite.xsd
  Scenario: Generate graph model with no config
    Given I access dataspace "FastTrack>[06] Locations data>Company sites"
    Given I access dataset "Company sites"
    And user views data model graph
    Then the graph should be displayed
    And verify display graph template       
    
  #@Hotel.xsd
  #Scenario: Generate graph model with no config
    #Given I access dataspace "FastTrack>[06] Locations data>Hotels"
    #Given I access dataset "Hotels"
    #And user views data model graph
    #Then the graph should be displayed
    #And verify display graph template    

  @Bloomberg.xsd
  Scenario: Generate graph model with no config
    Given I access dataspace "FastTrack>[06] Locations data>[08] Data providers"
    Given I access dataset "Bloomberg - Legal entities"
    And user views data model graph
    Then the graph should be displayed
    And verify display graph template  
    
  @CounterpartiesSupervision.xsd
  Scenario: Generate graph model with no config
    Given I access dataspace "FastTrack>[09] Technical data>Counterparties supervision"
    Given I access dataset "Counterparties supervision"
    And user views data model graph
    Then the graph should be displayed
    And verify display graph template          
    
  @SalesforceConfig.xsd
  Scenario: Generate graph model with no config
    Given I access dataspace "FastTrack>[09] Technical data>Salesforce integration"
    Given I access dataset "Salesforce integration"
    And user views data model graph
    Then the graph should be displayed
    And verify display graph template       
    
  @Supervision.xsd
  Scenario: Generate graph model with no config
    Given I access dataspace "FastTrack>[09] Technical data>Supervision"
    Given I access dataset "Supervision"
    And user views data model graph
    Then the graph should be displayed
    And verify display graph template   
    
 Scenario: ModelG_84 - Check Fullscreen when click icon button and click again
    Given I access dataspace "FastTrack>[03] Parties data>Company employees"
    Given I access dataset "Company employees"
    And user views data model graph
    Then the graph should be displayed			
    When user selects fullscreen graph
    Then graph should be displayed fullscreen
    When user exits fullscreen
    Then graph should be displayed normally
    
  Scenario: ModelG_88- Check Close Graph when click button
    Given I access dataspace "FastTrack>[03] Parties data>Company employees"
    Given I access dataset "Company employees"
    And user views data model graph
    Then the graph should be displayed
    When user closes graph
    Then the graph is no longer displayed.
    When user views data model graph
    Then the graph should be displayed        
             