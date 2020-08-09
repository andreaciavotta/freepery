Feature: Admin Panel
  As a an admin
  So I can have full control of the system
  I want to have special permissions

Scenario: View secret conversations as admin
  Given I am a registered user
  And I have admin permissions
  Then I log in
  When I am on the homepage
  Then I should see "Conversazioni private"
  When I follow "Conversazioni private"
  Then I should see "Conversazioni private"

Scenario: View secret conversations as user
  Given I am a registered user
  When I am on the homepage
  Then I should not see "Conversazioni private"

Scenario: Edit another user post as admin
    Given I am a registered user
    And I have admin permissions
    And there's another user
    And a post by this user exists
    Then I log in
    When I edit that post
    Then I should see "Modifica messaggio"
    When I fill in "post[post]" with "Post modificato da mariorossi"
    And I press "Invia"
    Then I should see "Post was successfully updated."
    And I should see "Post modificato da mariorossi"

Scenario: Edit another user comment as admin
   Given I am a registered user
   And I have admin permissions
   And I log in
   When I am on the homepage
   Then I follow "Board"
   And there's another user
   And a post by this user exists
   And another user comment to that post exists
   When I see that post
   Then I should see "1 commenti"
   And I should see "Commento inserito da antoniobianchi"
   When I edit that comment
   Then I should see "Modifica commento"
   When I fill in "reply[reply]" with "Commento modificato da mariorossi"
   And I press "Modifica"
   Then I should see "Commento modificato correttamente"
