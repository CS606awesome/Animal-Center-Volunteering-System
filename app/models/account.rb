class Account < ActiveRecord::Base
    
    has_one :current_worker
    has_one :former_criminal
    has_one :related_councilmember
    has_one :user_formerworker
    has_one :accommodation
    
    has_one :application_form
    has_one :criminal_application
    has_one :minor_application
    has_one :student_application
    
    accepts_nested_attributes_for :current_worker, allow_destroy: true
    accepts_nested_attributes_for :former_criminal, allow_destroy: true
    accepts_nested_attributes_for :related_councilmember, allow_destroy: true
    accepts_nested_attributes_for :user_formerworker, allow_destroy: true
    accepts_nested_attributes_for :accommodation, allow_destroy: true
    
    accepts_nested_attributes_for :application_form, allow_destroy: true
    accepts_nested_attributes_for :criminal_application, allow_destroy: true
    accepts_nested_attributes_for :minor_application, allow_destroy: true
    accepts_nested_attributes_for :student_application, allow_destroy: true
    
has_secure_password
validates :email,:firstname,:lastname,:homephone,
  presence: true,
  :on => [ :create ]
  validates :password,
  length: { in: 6..20,
             to_short: "your password should be at least %{count} characters",
             to_long: "your password should be at most %{count} characters" },
  :on => [ :create ]
  #validates :email
  validates :email, email: true
  ##validates_email_realness_of :email
  EmailVerifier.config do |config|
   config.verifier_email = "realname@realdomain.com"
  end
  ###################################
  #validates :name validator
  INVALID_NAME_REGEX = /[^a-zA-Z     ]/
  validates :firstname,:lastname,
  length: { maximum: 20 },
  format: { without: INVALID_NAME_REGEX }
  #validates :unique email                                  
  validates  :email,
  uniqueness: { case_sensitive: true, on: [:create] }
  #####################################
  #validates :number validator 
  INVALID_NUMBER_REGEX = /[^0-9     ]/
  validates :homephone,
  length: { maximum: 20 },
  format: { without: INVALID_NUMBER_REGEX }
   
end
