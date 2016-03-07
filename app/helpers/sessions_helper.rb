module SessionsHelper
	 def log_in(account)
    session[:account_id] = account.id
  end
  def log_out
    session.delete(:account_id)
  end
end
