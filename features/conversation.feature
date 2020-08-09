Feature: Manage conversations
  As a registered user
  So that I can interact privately with users
  I want to manage conversations

Scenario: Send private message
  Given I am a registered user
  And there's another user
  When I log in
  And I am on the conversations page
  Then I should see "Messaggia con antoniobianchi"
  When I follow "Messaggia con antoniobianchi"
  Then I should see "Messaggio privato ad antoniobianchi"
  When I fill in "message[body]" with "Ciao Antonio"
  And I press "Invia"
  Then I should see "Ciao Antonio"

