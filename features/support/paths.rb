# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  
  def path_to(page_name)
  if page_name =~ /the (.*) for "(.*)"/
      email_name = $2.to_s
      page_name  = $1.to_s
  end  
    case page_name
    
    when /^input_your_email page$/
       input_your_email_path 
    when /^log in page$/ 
       login_path
    when /^check_your_email page$/
       check_your_email_path
  
   
   when /^reset_your_password page$/ 
      # id=Account.find_by($1)
      #"/reset_your_password?id=#{id}" 
      #@account = Account.find_by_email('670348828@qq.com')
      #id = @account.id
      reset_your_password_path(Account.find_by_email(email_name))
  
  
    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
