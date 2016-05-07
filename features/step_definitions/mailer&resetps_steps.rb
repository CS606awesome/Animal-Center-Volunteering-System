
 
Then(/^I should still be on the input_your_email page$/) do
    input_your_email_path
end

Given(/^I type "([^"]*)" in "([^"]*)"$/) do |element, text|
  fill_in(:password, with: element, match: :first)
  page.should have_content text
end

