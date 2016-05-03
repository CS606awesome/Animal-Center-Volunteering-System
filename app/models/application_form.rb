class ApplicationForm < ActiveRecord::Base
    belongs_to :account
    
validates :signature, :available_time_begin, :available_time_end, #:interested_areas, 
    presence: true,
    :on => [ :update ] 
    #if => 
DATE_TIME_FORMAT = /^\d\d\d\d-(0?[1-9]|1[0-2])-(0?[1-9]|[12][0-9]|3[01]) (00|[0-9]|1[0-9]|2[0-3]):([0-9]|[0-5][0-9])$/    
validates_format_of :available_time_begin, :available_time_end,
                    :with => DATE_TIME_FORMAT, 
                    :message => "datetime must be in the following format: yyyy-mm-dd hh:mm",
                    :on => [:update ],
                    :multiline => true
    
end
