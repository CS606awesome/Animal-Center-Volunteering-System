Given(/^the following accounts exist:$/) do |accounts_table|
  accounts_table.hashes.each do |account|
  #each returned element will be a hash whose key is the table header.
  Account.create(account)
  end
end
 
Then(/^I should still be on the input_your_email page$/) do
    input_your_email_path
end


