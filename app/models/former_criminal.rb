class FormerCriminal < ActiveRecord::Base
    belongs_to :account
    
validates :name_of_court, :date_of_conviction, :nature_of_offense, :disposition_of_case, :former_crime,
  presence: true,
  :on => [ :update ],
  :if => :choose_yes?
  
  def choose_yes?
      account.has_convictions == true
  end
    
end
