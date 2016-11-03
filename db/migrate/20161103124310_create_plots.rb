class CreatePlots < ActiveRecord::Migration[5.0]
  def change
    create_table :plots do |t|
      t.string :prefix
      t.integer :number
      t.belongs_to :unit_type, foreign_key: true

      t.timestamps
    end
  end
end
