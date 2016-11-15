class AddDeveloperAndDivisionToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :developer, foreign_key: true
    add_reference :users, :division, foreign_key: true
  end
end
