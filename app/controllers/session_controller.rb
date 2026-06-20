class SessionController <ApplicationController
    def destroy
        # set session to nill
        session[:user_id] = nil
        #redirect path
        redirect_to root_path, notice:"Logged out"
    end
end