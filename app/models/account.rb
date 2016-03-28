class Account < ActiveRecord::Base
    
    has_one :current_worker
    has_one :former_criminal
    has_one :related_councilmember
    has_one :user_formerworker
    
    accepts_nested_attributes_for :current_worker, allow_destroy: true
    accepts_nested_attributes_for :former_criminal, allow_destroy: true
    accepts_nested_attributes_for :related_councilmember, allow_destroy: true
    accepts_nested_attributes_for :user_formerworker, allow_destroy: true
    
before_validation :ensure_has_value
has_secure_password
validates :password, 
             presence: true,
             length: { in: 6..20,
             to_short: "your password should be at least %{count} characters",
             to_long: "your password should be at most %{count} characters" }
protected 
    def ensure_has_value
      self.email = 'blank' if email.blank?
    end 
   
      
end
