class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.belongs_to :unit_type, foreign_key: true

      t.timestamps
    end
  end
end
