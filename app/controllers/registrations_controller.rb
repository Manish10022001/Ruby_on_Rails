class RegistrationsController <ApplicationController
    def new
        #Create new user, we use instace we it can be used outside this method
        @user = User.new

    end

    def create
        # render plain: params -> {"authenticity_token" => "FDSiBy2QP2O4yx9JOOpO_nh68-ckLL_P9ndJzPKRV4cSMs5SabCpJwZppTorQMWsiuP5r6a2NOTFLsItvsI4Fw", "user" => {"email" => "abc@gmail.com", "password" => "abc", "password_confirmation" => "abc"}, "commit" => "Sign up", "controller" => "registrations", "action" => "create"}
        #render plain: params[:user] -> {"email" => "abc@gmail.com", "password" => "abc", "password_confirmation" => "abc"}
        
        #create user
       # @user = User.new(params[:user]) this also works but it is not secure so, we use helper method as private
       @user = User.new(user_params)
       if @user.save
        # cookies[:user_id]
        session[:user_id] = @user.id #store in session cookies
        redirect_to root_path, notice:"Successfully created account"
       else
        render :new
       end 
        
    end

    private
    def user_params
        #params need to have user , and only allow given fields to store in db
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end