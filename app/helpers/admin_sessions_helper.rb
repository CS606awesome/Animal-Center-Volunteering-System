module AdminSessionsHelper
	 def admin_log_in(admin)
    session[:adminid] = admin.id
     end
     def admin_logged_in
     	session[:adminid]
     end
     def admin_log_out
     session.delete(:adminid)
  end
end
