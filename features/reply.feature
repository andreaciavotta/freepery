Feature: Manage comments
  As a registered user
  So that I can interact with the website
  I want to manage comments

Scenario: Create comment
  Given I am a registered user
  And there's another user
  And a post by this user exists
  Then I log in
  When I see that post
  Then I should see "Lascia un commento"
  When I fill in "reply[reply]" with "Commento nuovo di Mario"
  And I press "Rispondi"
  When I see that post
  Then I should see "1 commenti"

Scenario: Edit comment as comment owner
  Given I am a registered user
  And there's another user
  And a post by this user exists
  And my comment to that post exists
  Then I log in
  When I see that post
  Then I should see "Commento inserito da mariorossi"
  And I should see "1 commenti"
  When I edit that comment
  Then I should see "Modifica commento"
  When I fill in "reply[reply]" with "Commento modificato"
  And I press "Modifica"
  Then I should see "Commento modificato correttamente"

Scenario: Edit comment as post owner
   Given I am a registered user
   And I log in
   When I am on the homepage
   Then I follow "Board"
   And a post of mine exists
   And there's another user
   And another user comment to that post exists
   When I see that post
   Then I should see "1 commenti"
   And I should see "Commento inserito da antoniobianchi"
   When I edit that comment
   Then I should see "Modifica commento"
   When I fill in "reply[reply]" with "Commento modificato da mariorossi"
   And I press "Modifica"
   Then I should see "Commento modificato correttamente"

Scenario: Edit another user comment
   Given I am a registered user
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
   Then I should see "Non hai i privilegi necessari per accedere a questa funzione"
