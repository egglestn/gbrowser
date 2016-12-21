class CreateUserLoginContents < ActiveRecord::Migration[5.0]
  def change
    create_table :user_login_contents do |t|
      t.string :title_left
      t.string :title_right
      t.text :blurb_para_1
      t.text :blurb_para_2
      t.string :background_image

      t.timestamps
    end
  end
end
