class CreateBatches < ActiveRecord::Migration[5.2]
  def change
    create_table :batches do |t|
      t.string :standard, index: true
      t.string :section
      t.date :start_date
      t.date :end_date
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
