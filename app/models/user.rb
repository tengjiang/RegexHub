class User < ActiveRecord::Base
    validates_uniqueness_of :username , message: "Username already taken!"
    has_secure_password
end
