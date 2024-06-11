class ApplicationController < ActionController::Base

    helper_method :current_user
    # What we did here above is the application controller methods will make sure this method is reachable to all controllers
    # but we need the views also to use this method.
    # if we declare it in the above way the views can also use it instead of explicitly writing the method in the helper/application_helper

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
end
