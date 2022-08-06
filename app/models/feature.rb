class Feature < ApplicationRecord
  validates :title, presence: true
  belongs_to :project
  belongs_to :user
  has_many :notes, as: :notable
  has_many :lists, as: :listable
  enum status: { created: 0, paused: 1, working: 2, ready: 3, completed: 4 }
  enum priority: { low: 0, medium: 1, high: 2 }
end