class Feature < ApplicationRecord
  belongs_to :project
  has_many :notes, as: :notable
  has_many :lists, as: :listable
  enum status: { created: 0, paused: 1, working: 2, review: 3, completed: 4 }
  enum priority: { low: 0, medium: 1, high: 2 }
end