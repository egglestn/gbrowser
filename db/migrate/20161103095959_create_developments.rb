class CreateDevelopments < ActiveRecord::Migration[5.0]
  def change
    create_table :developments do |t|
      t.string :development_name
      t.belongs_to :developer, foreign_key: true
      t.string :office_address
      t.string :city
      t.string :county
      t.string :postcode
      t.string :email
      t.string :contact_number

      t.timestamps
    end
  end
end
