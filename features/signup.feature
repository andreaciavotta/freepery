Feature: User can create a new account
  As a visitor
  I want to create a new account
  So that I can access to the system

Scenario: Create a new account
  Given I am on the signup page
  When I fill in "account[email]" with "mariorossi@mariorossi.com"
  And I fill in "account[username]" with "mariorossi"
  And I fill in "account[first_name]" with "Mario"
  And I fill in "account[last_name]" with "Rossi"
  And I fill in "account[address]" with "Milano, Italy"
  And I fill in "account[password]" with "123456"
  And I fill in "account[password_confirmation]" with "123456"
  And I press "Iscriviti"

Scenario: Can't create an account (username required)
  Given I am on the signup page
  When I fill in "account[email]" with "mariorossi@mariorossi.com"
  And I fill in "account[password]" with "123456"
  And I fill in "account[password_confirmation]" with "123456"
  And I press "Iscriviti"
  Then I should see "can't be blank"
