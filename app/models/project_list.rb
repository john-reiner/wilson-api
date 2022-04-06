class ProjectList < ApplicationRecord
  belongs_to :project
  has_many :project_list_tasks
end
