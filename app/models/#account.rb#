class Account < ActiveRecord::Base
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
