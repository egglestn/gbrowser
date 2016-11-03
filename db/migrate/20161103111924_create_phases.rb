class CreatePhases < ActiveRecord::Migration[5.0]
  def change
    create_table :phases do |t|
      t.string :name
      t.belongs_to :development, foreign_key: true

      t.timestamps
    end
  end
end
