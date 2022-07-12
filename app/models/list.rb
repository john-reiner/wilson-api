class List < ApplicationRecord
  belongs_to :listable, polymorphic: true
  belongs_to :user
  has_many :tasks, :dependent => :destroy
  enum status: { pending: 0, working: 1, ready: 2, completed: 3 }
end
