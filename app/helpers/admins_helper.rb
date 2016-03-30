module AdminsHelper

  def to_sec(date)
  	date.to_time.to_i
  end
  def to_sec(s)
  	s.to_time.to_i
  end
end
