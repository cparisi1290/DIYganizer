class User < ApplicationRecord
    has_secure_password

    def self.from_omniauth(response)
        User.find_or_create_by(uid: response[:id], provider: response[:provider]) do |u|
            u.name = response[:info][:name]
            u.email = response[:info][:email]
            u.password = SecureRandom.hex(15)
        end
    end
end
