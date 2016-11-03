class CreateDevelopers < ActiveRecord::Migration[5.0]
  def change
    create_table :developers do |t|
      t.string :company_name
      t.string :position
      t.string :head_office_address
      t.string :city
      t.string :county
      t.string :postcode
      t.string :email
      t.string :contact_number

      t.timestamps
    end
  end
end
