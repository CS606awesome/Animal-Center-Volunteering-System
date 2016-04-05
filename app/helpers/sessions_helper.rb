module SessionsHelper
  def log_in(account=nil)
    session[:id] = account.id
  end
  
  def logged_in
  	session[:id]
  end
  def log_out
    session.delete(:id)
  end
end
