@SYSTEM_TEST
Feature: Dashboard creation
  I want to use this template for Dashboard creation

  Scenario: DC12- Create new a dashboard successfully
    Given I login to EBX successfully
    And I access dataspace "Primary"
    And I access dataset "FirstDataset"
    And I select dataset service "Insight Rework > Dashboard creation"
    And I create dashboard with the followings
      | Dashboard name:TXT | Design template:DDL | Owner:DDL           | Share with:GROUP                    |
      | Dashboard 1        |                     | admin admin (admin) | lee jessie (jessie),luna kim (luna) |
    Then I should see the dashboard configuration pane

  Scenario: DC05- Validate "Dashboard name" field on dashboard creation form when leave blank field
    Given I login to EBX successfully
    And I access dataspace "Primary"
    And I access dataset "FirstDataset"
    And I select dataset service "Insight Rework > Dashboard creation"
    And I create dashboard with the followings
      | Dashboard name:TXT | Design template:DDL | Owner:DDL           | Share with:GROUP |
      |                    |                     | admin admin (admin) | jessie           |
    And block of error messages are displayed like below
      | Block          | Message                     |
      | Dashboard name | Dashboard name is mandatory |

#  Scenario: DC13- Validate dashboard information when dashboard has been created succesfully with user language is English
#    Given I login to EBX successfully
#    And I access dataspace "Primary"
#    And I access dataset "FirstDataset"
#    And I select dataset service "Insight Rework > Dashboard creation"
#    And I create dashboard with the followings
#      | Dashboard english name:TXT | Dashboard english description:TXT | Dashboard french name:TXT | Dashboard french description:TXT | Design template:DDL | Owner:DDL | Share with:GROUP |
#      | Dashboard 1                | For english                       | admin admin (admin)                     | for french                       |                     | admin     | jessie,luna      |

  Scenario: DC29- Check the respond after clicking on 'create new section' icon in English language
    Given I login to EBX successfully
    And I access dataspace "Primary"
    And I access dataset "FirstDataset"
    And I select dataset service "Insight Rework > Dashboard creation"
    And I create dashboard with the followings
      | Dashboard name:TXT | Design template:DDL | Owner:DDL           | Share with:GROUP                    |
      | Dashboard 1        |                     | admin admin (admin) | lee jessie (jessie),luna kim (luna) |
    And I create section "Section 1st"
    And I should see the blank tile in the section








