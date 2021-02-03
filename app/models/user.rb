class User < ApplicationRecord

    has_secure_password
    has_many :goals
    validates :username, presence: true, length: { minimum: 8 }, uniqueness: true

end
