Feature: Click Me button and count

  As a user
  I want to click a button
  So I can see the count go up

  Scenario: Initial State
    Given I goto page "/"
    Then Page has text "button 0 times."

  @watch
  Scenario: Click "Click Me" button
    Given I goto page "/"
    When I click "button"
    Then Page has text "button 1 times."

  @watch
  Scenario: Initial state and click
    Given I goto page "/"
    Then Page has text "button 0 times."
    When I click "button"
    Then Page has text "button 1 times."
    When I click "button"
    Then Page has text "button 2 times."
