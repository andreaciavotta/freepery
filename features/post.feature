Feature: Manage post
  As a registered user
  So that I can interact with the website
  I want to manage posts

Scenario: Create post
  Given I am a registered user
  And I log in
  When I am on the homepage
  Then I follow "Board"
  Then I should see "Messaggio"
  And I fill in "post[post]" with "Questo è il mio messaggio di prova"
  And I press "Invia"
  Then I should see "Post di mariorossi"
  And I should see "Questo è il mio messaggio di prova"

Scenario: View other user's post
    Given there's another user
    And he logs in
    And he create a post
    When he logs out
    Given I am a registered user
    Then I log in
    When I am on the homepage
    Then I follow "Board"
    And I should see "Messaggio di antoniobianchi"

Scenario: Edit an own post
    Given I am a registered user
    And I log in
    When I am on the homepage
    Then I follow "Board"
    And a post of mine exists
    When I edit that post
    Then I should see "Modifica messaggio"
    When I fill in "post[post]" with "Post modificato da mariorossi"
    And I press "Invia"
    Then I should see "Post was successfully updated."
    And I should see "Post modificato da mariorossi"

Scenario: Edit another user post
    Given I am a registered user
    And there's another user
    And a post by this user exists
    Then I log in
    When I edit that post
    Then I should see "Non puoi modificare un post non creato da te!"

