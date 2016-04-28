class RelatedCouncilmember < ActiveRecord::Base
    belongs_to :account
    
#validates :name, :relationship, 
#  presence: true,
#  :on => [ :create ]
#  INVALID_NAME_REGEX = /[^a-zA-Z     ]/
#  validates :relationship, 
#  length: { maximum: 50 },
#  format: { without: INVALID_NAME_REGEX }

#validates :relationship, :name,
#  presence: true,
#  :on => [ :update ],
#  :if => :choose_yes?
  
#  def choose_yes?
#      account.related_to_councilmember == true
#  end
  
#validates :name,
#  presence: true,
#  :on => [ :update ]
  #:if => :is_nil?

end
