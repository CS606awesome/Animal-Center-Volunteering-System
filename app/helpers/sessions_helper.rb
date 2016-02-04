module SessionsHelper
  def log_in(account)
    session[:account_id] = account.id
  end
   
end
