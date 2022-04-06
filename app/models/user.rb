class User < ApplicationRecord

    has_secure_password
    has_many :goals
    has_many :projects
    validates :username, presence: true, length: { minimum: 8 }, uniqueness: true
    validates :password, presence: true, length: { minimum: 8 }

end
