class CreateSchoolBatches < ActiveRecord::Migration[5.2]
  def change
    create_table :school_batches do |t|
      t.belongs_to :batch, foreign_key: true
      t.integer :status, default: 0
      t.references :batchable, polymorphic: true

      t.timestamps
    end
  end
end
