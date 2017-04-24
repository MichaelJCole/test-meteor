Feature: Click Me button and count

  As a user
  I want to view and add links
  So I can save links

  @watch
  Scenario: Initial State
    Given I goto page "/"
    Then Page has text "Learn Meteor!"

  @watch
  Scenario: View Links
    Given I goto page "/"
    Then Page has text "Do the Tutorial"
    Then Page has text "Follow the Guide"
    Then Page has text "Read the Docs"
    Then Page has text "Discussions"

  @watch
  Scenario: Add and view link
    Given I goto page "/"
    When I type into "input[name=title]" "Special Link"
    And I type into "input[name=url]" "http://google.com"
    And I submit form ".info-link-add"
    And Page has link "Special Link" to "http://google.com"
    