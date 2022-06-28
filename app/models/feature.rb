class Feature < ApplicationRecord
  belongs_to :project
  has_many :notes, as: :notable
  has_many :lists, as: :listable
end
