module AdminsHelper

  def to_sec(date)
  	date.to_time.to_i
  end
  def to_sec(s)
  	s.to_i       #im not sure if it should be s.to_time.to_i or this one
  end
end
