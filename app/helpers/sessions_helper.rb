module SessionsHelper
	def signed_in?
    	!current_admin.nil?
  	end
end