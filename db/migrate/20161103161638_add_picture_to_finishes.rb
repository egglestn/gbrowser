class AddPictureToFinishes < ActiveRecord::Migration[5.0]
  def change
    add_column :finishes, :picture, :string
  end
end
