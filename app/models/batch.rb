class Batch < ApplicationRecord

  validates :standard, :start_date, :end_date, presence: true
end
