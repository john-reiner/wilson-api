class Project < ApplicationRecord
    validates :title, presence: true
    belongs_to :user
    has_many :features
    has_many :project_notes
    has_many :project_list
    has_many :project_tags
end
