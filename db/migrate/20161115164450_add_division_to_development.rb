class AddDivisionToDevelopment < ActiveRecord::Migration[5.0]
  def change
    add_reference :developments, :division, foreign_key: true
  end
end
