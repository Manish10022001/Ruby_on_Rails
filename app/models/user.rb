# email : string
# password_digest : string

#has_secure_password along with above fields add 2 virtual attribues, and we r going to interact with these two only instead of password_digest
# password : string virtual
# password_confirmation : string virtual

#has_secure_password make sure password and password_confirmation match, then it takes the password and run it through bcrypt to create a digest(hash) and then assign that to password_digest
class User < ApplicationRecord
    has_secure_password
end
