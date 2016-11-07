class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :title
      t.references :imageable, polymorphic: true, index: true
      t.string :file
    end
  end
end
