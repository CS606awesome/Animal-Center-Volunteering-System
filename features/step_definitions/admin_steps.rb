Given /the following volunteers exist/ do |volunteers_table|
  volunteers_table.hashes.each do |account|
    Account.create!(account)
  end
end

Then /^I should see the following table:$/ do |table|
  table.hashes.each do |row|
       puts row["code"]
    end
  end
  

