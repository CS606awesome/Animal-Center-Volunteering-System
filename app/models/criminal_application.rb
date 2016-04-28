class CriminalApplication < ActiveRecord::Base
    belongs_to :account
    
validates :mandatory_hours, 
    presence: true,
    :on => [ :update ] 
end
