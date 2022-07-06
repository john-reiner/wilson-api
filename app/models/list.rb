class List < ApplicationRecord
  belongs_to :listable, polymorphic: true
  belongs_to :user
  has_many :tasks, :dependent => :destroy
end
