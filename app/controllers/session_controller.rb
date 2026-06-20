class SessionController <ApplicationController
    def new
    
    end

    def create
        user = User.find_by(email: params[:email])
        # if user found then stored session to user id and then redirect to root path
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice:"Logged in Successfully"
        else
            flash[:alert]="Invalid email or password"
            render :new # tthis takes us again to sign in page
        end
    end
    def destroy
        # set session to nill
        session[:user_id] = nil
        #redirect path
        redirect_to root_path, notice:"Logged out"
    end
end