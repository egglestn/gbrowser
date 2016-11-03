class CreateFinishes < ActiveRecord::Migration[5.0]
  def change
    create_table :finishes do |t|
      t.belongs_to :room, foreign_key: true
      t.string :name
      t.string :category

      t.timestamps
    end
  end
end
