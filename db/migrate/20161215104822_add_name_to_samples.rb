class AddNameToSamples < ActiveRecord::Migration[5.0]
  def change
    add_column :samples, :name, :string
  end
end
