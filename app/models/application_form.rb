class ApplicationForm < ActiveRecord::Base
    
validates :signature,
    presence: true,
    :on => [ :update ]
    
end
