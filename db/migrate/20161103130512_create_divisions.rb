class CreateDivisions < ActiveRecord::Migration[5.0]
  def change
    create_table :divisions do |t|
      t.string :division_name
      t.string :address
      t.string :city
      t.string :county
      t.string :postcode
      t.string :email
      t.string :contact_number
      t.belongs_to :developer, foreign_key: true
    end
  end
end
