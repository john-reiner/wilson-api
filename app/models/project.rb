class Project < ApplicationRecord
    validates :title, presence: true
    belongs_to :user
    has_many :features, :dependent => :destroy
    has_many :notes, as: :notable, :dependent => :destroy
    has_many :lists, as: :listable, :dependent => :destroy
end
