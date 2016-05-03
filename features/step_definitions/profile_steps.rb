Given /the following accounts exist/ do |accounts_table|
  accounts_table.hashes.each do |account|
    Account.create!(account)
    # each returned element will be a hash whose key is the table header.
  end
end

#Given /I am logged in/ do
#  session[:id] = 1
#end


#Then /^(?:|I )should see "([^"]*)"$/ do |text|
#    page.should have_content(text)
#end

Then /the emergency_contact_name of "(.*)" should be "(.*)"/ do |email_name, emergency_contact_name|
  Account.find_by_email(email_name).emergency_contact_name == emergency_contact_name
end

#Given /^(?:|I )am on (.+)$/ do |page_name|
#  visit path_to(page_name)
#end

