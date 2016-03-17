# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

accounts =  [{:email => '423523@qwe.com',
             :firstname => 'xudong',
             :middlename => 'laoxian',
             :lastname => 'huang',
             :password_digest => '123457777' ,
             :current_address => 'baker street',
             :homephone => '4543656345',
             :DOB => '2000-1-1',
             :cellphone => '54356565'}]

accounts.each do |account|
  Account.create!(account)
end