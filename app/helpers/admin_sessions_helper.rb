module AdminSessionsHelper
	 def admin_log_in(admin)
    session[:id] = admin.id
     end
     def admin_logged_in
     	session[:id]
     end
     def admin_log_out
     session.delete(:id)
  end
end
