Feature: Manage Likes
  As a registered user
  So that I can interact with another user
  I want to add or remove like to posts

Scenario: Like other user's post
    Given I am a registered user
    And there's another user
    And a post by this user exists
    Then I log in
    And I see that post
    Then I press "Mi piace"
    And I should see "1 likes"

Scenario: Unlike other user's post
    Given I am a registered user
    And there's another user
    And a post by this user exists
    Then I log in
    And I see that post
    Then I press "Mi piace"
    And I should see "1 likes"
    Then I press "Non mi piace"
    And I should see "0 likes"
