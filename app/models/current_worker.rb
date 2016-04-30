class CurrentWorker < ActiveRecord::Base
    belongs_to :account

    
validates :name, :department,
  presence: true,
  :on => [ :update ],
  :if => :choose_yes?
  
  def choose_yes?
      account.is_current_worker == true
  end
  
  
end
