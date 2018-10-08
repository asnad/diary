class Batch < ApplicationRecord

  has_many :school_batches #to add association with students, teachers
  validates :standard, :start_date, :end_date, presence: true

  enum status: [:active, :completed, :pending]
end
