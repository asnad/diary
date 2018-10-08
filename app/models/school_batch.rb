class SchoolBatch < ApplicationRecord
  belongs_to :batch
  belongs_to :batchable, polymorphic: true

  enum status: [:active, :deactive]
end
