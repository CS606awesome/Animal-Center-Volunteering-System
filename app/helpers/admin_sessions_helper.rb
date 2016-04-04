module AdminSessionsHelper
	 def log_in(admin)
    session[:id] = admin.id
  end
end
