Given /the following accounts exist/ do |accounts_table|
  accounts_table.hashes.each do |account|
    Account.create!(account)
    # each returned element will be a hash whose key is the table header.
  end
end

#Then /^(?:|I )should see "([^"]*)"$/ do |text|
#    page.should have_content(text)
#end

Then /the emergency_contact_name of "(.*)" should be "(.*)"/ do |email_name, emergency_contact_name|
  Account.find_by_email(email_name).emergency_contact_name == emergency_contact_name
end

#Given /^(?:|I )am on (.+)$/ do |page_name|
#  visit path_to(page_name)
#end

When /^(?:|I )check "([^\"]*)"(?: with "([^\"]*)")?$/ do |field, selector|
  find('label', :text => '1.Are you a former worker of the city of Bryan?').choose("account_is_former_worker_1")
  #check("account_is_former_worker_1")
end