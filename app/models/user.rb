class User < ApplicationRecord
    has_secure_password
    has_many :goals
    has_many :projects
    has_many :notes
    has_many :lists
    validates :email, presence: true
    validates :password, presence: true, length: { minimum: 8 }
    validates :email, uniqueness: true
end
