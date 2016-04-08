Given(/^the following accounts exist:$/) do |accounts_table|
  accounts_table.hashes.each do |account|
  #each returned element will be a hash whose key is the table header.
  Account.create(account)
  end
end

When(/^I click "([^"]*)"$/) do |link|
   click_link(link)
end

#When(/^I press "([^"]*)"$/) do |button|
#   click_button(button)
#end

Given(/^I fill in "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should still be on the input_your_email page$/) do
 current_path.should == input_your_email_path
end

Given(/^I am on the reset_your_password page for (.+)$/) do |email|
    
    
end

