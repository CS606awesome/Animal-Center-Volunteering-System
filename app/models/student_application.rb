class StudentApplication < ActiveRecord::Base
    belongs_to :account
    
validates :student_program, :required_area, :deadline, 
    presence: true,
    :on => [ :update ] 
end
