module AdminSessionsHelper
	 def admin_log_in(admin)
    session[:admin_id] = admin.id
     end
     def admin_logged_in
     	session[:admin_id]
     end
     def admin_log_out
     session.delete(:admin_id)
  end
end
