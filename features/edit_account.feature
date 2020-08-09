Feature: Edit account
  As a registered user
  So that I can change the info about me
  I want to edit my account

Scenario: Edit account
  Given I am a registered user
  And I log in
  When I follow "Modifica dati"
  And I fill in "account[email]" with "mariorossinewmail@mariorossi.com"
  And I fill in "account[address]" with "Monza, Italy"
  And I fill in "account[current_password]" with "123456"
  And I press "Aggiorna"
  Then I am on the home page
  When I follow "Modifica dati"
  Then the "account[email]" field should contain "mariorossinewmail@mariorossi.com"
  And the "account[address]" field should contain "Monza, Italy"

