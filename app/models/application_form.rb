class ApplicationForm < ActiveRecord::Base
    belongs_to :account
    
validates :signature, :available_time_begin, :available_time_end, #:interested_areas, 
    presence: true,
    :on => [ :update ] 
    #if => 

    
end
