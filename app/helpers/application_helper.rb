module ApplicationHelper
    def logged_in?
        session[:user_id].nil?
    end
    
    def current_user
        @current_user = User.find_by_id(session[:id])
    end
end
