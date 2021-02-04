class Goal < ApplicationRecord
    belongs_to :user
    has_many :tasks
    validates :name, presence: true
    validates :description, presence: true

    after_initialize :set_defaults 

    def set_defaults 
        self.completed ||= false
        self.rgb ||= "rgb(#{rand(1..255)},#{rand(1..255)},#{rand(1..255)})"
    end 
end