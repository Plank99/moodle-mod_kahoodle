@mod @mod_kahoodle @javascript
Feature: Participant gameplay with several correct answers
  As a student
  I can select every answer I believe is correct and submit them together

  Background:
    Given the following config values are set as admin:
      | requesttimeout | 2 | realtimeplugin_phppoll |
    And the following "users" exist:
      | username | firstname | lastname | email                |
      | student1 | Sam       | Student  | student1@example.com |
    And the following "courses" exist:
      | fullname | shortname | category |
      | Course 1 | C1        | 0        |
    And the following "course enrolments" exist:
      | user     | course | role    |
      | student1 | C1     | student |
    And the following "activities" exist:
      | activity | name          | course | idnumber  |
      | kahoodle | Test Kahoodle | C1     | kahoodle1 |
    And the following "mod_kahoodle > questions" exist:
      | kahoodle      | questiontext       | questionconfig         |
      | Test Kahoodle | Which are mammals? | Trout\n*Dog\n*Whale\nOak |
    And the kahoodle "Test Kahoodle" round stage is "lobby"
    And I log in as "student1"
    And I am on the "Test Kahoodle" "kahoodle activity" page
    And I press "Join"
    And I should see "You are joining as" in the ".mod_kahoodle-participant-container" "css_element"

  Scenario: Selecting both correct answers and confirming scores the question
    When the kahoodle "Test Kahoodle" round stage is "question-1"
    And I wait until ".mod_kahoodle-participant-question-content" "css_element" exists
    Then I should see "Select every correct answer" in the ".mod_kahoodle-options-confirm" "css_element"
    # Picking an option must not submit the answer on its own.
    When I click on ".mod_kahoodle-option2" "css_element"
    Then ".mod_kahoodle-options-grid" "css_element" should exist
    And I should not see "Waiting for results..." in the ".mod_kahoodle-participant-container" "css_element"
    # Add the second correct answer, then confirm.
    When I click on ".mod_kahoodle-option3" "css_element"
    And I click on "Submit answer" "button"
    Then I should see "Waiting for results..." in the ".mod_kahoodle-participant-container" "css_element"
    When the kahoodle "Test Kahoodle" round stage is "results-1"
    And I wait until ".mod_kahoodle-participant-result-content" "css_element" exists
    Then I should see "Correct!" in the ".mod_kahoodle-participant-result-content" "css_element"
    # Make sure all php polling requests are finished before the end of the test
    When the kahoodle "Test Kahoodle" round stage is "archived"
    And I wait until "The activity has finished." "text" exists

  Scenario: Finding only one of the two correct answers scores nothing
    When the kahoodle "Test Kahoodle" round stage is "question-1"
    And I wait until ".mod_kahoodle-participant-question-content" "css_element" exists
    When I click on ".mod_kahoodle-option2" "css_element"
    And I click on "Submit answer" "button"
    Then I should see "Waiting for results..." in the ".mod_kahoodle-participant-container" "css_element"
    When the kahoodle "Test Kahoodle" round stage is "results-1"
    And I wait until ".mod_kahoodle-participant-result-content" "css_element" exists
    Then I should see "Incorrect" in the ".mod_kahoodle-participant-result-content" "css_element"
    # Make sure all php polling requests are finished before the end of the test
    When the kahoodle "Test Kahoodle" round stage is "archived"
    And I wait until "The activity has finished." "text" exists

  Scenario: Deselecting an option before confirming leaves it out of the answer
    When the kahoodle "Test Kahoodle" round stage is "question-1"
    And I wait until ".mod_kahoodle-participant-question-content" "css_element" exists
    # Select both correct answers plus a wrong one, then take the wrong one back.
    When I click on ".mod_kahoodle-option2" "css_element"
    And I click on ".mod_kahoodle-option3" "css_element"
    And I click on ".mod_kahoodle-option1" "css_element"
    And I click on ".mod_kahoodle-option1" "css_element"
    And I click on "Submit answer" "button"
    Then I should see "Waiting for results..." in the ".mod_kahoodle-participant-container" "css_element"
    When the kahoodle "Test Kahoodle" round stage is "results-1"
    And I wait until ".mod_kahoodle-participant-result-content" "css_element" exists
    Then I should see "Correct!" in the ".mod_kahoodle-participant-result-content" "css_element"
    # Make sure all php polling requests are finished before the end of the test
    When the kahoodle "Test Kahoodle" round stage is "archived"
    And I wait until "The activity has finished." "text" exists
