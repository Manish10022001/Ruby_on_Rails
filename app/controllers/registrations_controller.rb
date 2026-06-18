class RegistrationsController <ApplicationController
    def new
        #Create new user, we use instace we it can be used outside this method
        @user = User.new
    end
end