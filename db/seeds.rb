# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

accounts =  [{:email => '423523@qwe.com',
             :firstname => 'xudong',
             :lastname => 'huang',
             :password_digest => '123457777' ,
             :current_address => 'baker street',
             :homephone => '4543656345',
             :DOB => '2000-1-1',
             :cellphone => '54356565'}]

accounts.each do |account|
  Account.create!(account)
end
             
             # "emergency_contact_name" 'yifeng',
             # "emergency_phone_alternate" '2222222',
             # "DOB" '2000-1-1',
             # "is_former_worker" boolean,
             # "has_convictions" boolean,
             # "need_accomendations" boolean,
             # "related_to_councilmember" boolean,
             # "is_current_worker" boolean,
             # "picture" blob(2097152),
             # "driver_license" blob(2097152),
             # "SSN" integer,
             # "middlename" varchar
