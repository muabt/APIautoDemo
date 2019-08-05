@LOGIN
Feature: Login to system
  In order to using EBX system
  As a user
  I want to login to EBX system

  @type1
  Scenario: Login with a username
    Given the user is on the EBX home page
    When user login to EBX with username "tracy" and password "onvn"
    Then user should be logged successfully

  @type2-login
  Scenario Outline: Login with lot of input
    Given the user is on the EBX home page
    When user login to EBX with username is <user> and password is <pass>
    Then user verify the <status> in step

    Examples: 
      | user  | pass | status  |
      | tracy | onvn | success |
      | lily  |  123 | fail    |

  @type3
  Scenario Outline: Using datatable
    Given the user is on the EBX home page
    When user login to EBX with username and password as following with the "<KEY>"
      | KEY | Username | Password |
      |  01 | tracy    | onvn     |
      |  02 | lily     |      123 |
      |  03 | tracy    |          |
      |  04 |          | onvn     |
      |  05 |          |          |
    Then user verify the status as following with the "<KEY>"
      | KEY | Status  | User Error Message                | Password Error Message |
      |  01 | success |                                   |                        |
      |  02 | fail    | Unknown user or invalid password. |                        |
      |  03 | fail    |                                   | Field is mandatory.    |
      |  04 | fail    | Field is mandatory.               |                        |
      |  05 | fail    | Field is mandatory.               | Field is mandatory.    |

    Examples: 
      | KEY |
      |  01 |
      |  02 |
      |  03 |
      |  04 |
      |  05 |
