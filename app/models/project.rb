class Project < ApplicationRecord
    validates :title, presence: true
    belongs_to :user
    has_many :features, :dependent => :destroy
    has_many :project_notes, :dependent => :destroy
    has_many :project_list, :dependent => :destroy
    has_many :project_tags, :dependent => :destroy
end
