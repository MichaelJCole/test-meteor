Feature: Click Me button and count

  As a user
  I want to click a button
  So I can see the count go up

  
  Scenario: Initial State
    Given I visit page "/"
    Then I see text "button 0 times."

  Scenario: Click "Click Me" button
    Given I visit page "/"
    When I click the button labeled "Click Me"
    Then I see text "button 1 times."

  Scenario: Initial state and click
    Given I visit page "/"
    Then I see text "button 0 times."
    When I click the button labeled "Click Me"
    Then I see text "button 1 times."
