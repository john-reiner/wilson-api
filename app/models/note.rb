class Note < ApplicationRecord
  validates :title, presence: true
  belongs_to :notable, polymorphic: true
  belongs_to :user
end
