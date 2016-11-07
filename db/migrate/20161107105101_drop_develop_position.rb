class DropDevelopPosition < ActiveRecord::Migration[5.0]
  def change
    remove_column :developers, :position
  end
end
