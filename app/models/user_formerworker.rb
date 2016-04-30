class UserFormerworker < ActiveRecord::Base
    belongs_to :account
    
#validates :reason_for_leaving, :position_or_department, 
##  presence: true,
#  :on => [ :create ]
#  INVALID_NAME_REGEX = /[^a-zA-Z     ]/
#  validates :position_or_department, 
#  length: { maximum: 50 },
#  format: { without: INVALID_NAME_REGEX }
  validates :date_of_employment, :reason_for_leaving, :position_or_department,
  presence: true,
  :on => [ :update ],
  :if => :choose_yes?
  
  def choose_yes?
      account.is_former_worker == true
  end

end
