class Task < ApplicationRecord

    belongs_to :goal
    validates :name, presence: true

    after_initialize :set_defaults 

    def set_defaults 
        self.completed ||= false
    end 
    
end
