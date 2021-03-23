class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true, uniqueness: { case_sensitive: false }
    validates :email, presence: true, uniqueness: true
    has_many :projects
    has_many :rooms, through: :projects


    def self.from_omniauth(response)
        User.find_or_create_by(uid: response[:id], provider: response[:provider]) do |u|
            u.name = response[:info][:name]
            u.email = response[:info][:email]
            u.password = SecureRandom.hex(15)
        end
    end
end
