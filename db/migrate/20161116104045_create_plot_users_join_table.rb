class CreatePlotUsersJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :plots, :users do |t|
      t.references :plot, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
