class CreateJoinTablePhaseUnitTypes < ActiveRecord::Migration[5.0]
  def up
    phase_unit_types = UnitType.pluck(:id, :phase_id)

    remove_foreign_key "unit_types", "phases"
    remove_column :unit_types, :phase_id

    create_join_table :phases, :unit_types do |t|
      t.index [:phase_id, :unit_type_id]
      t.index [:unit_type_id, :phase_id]
    end
  end

  def down
    drop_table :phases_unit_types
    add_column :unit_types, :phase_id, :integer
    add_foreign_key "unit_types", "phases"
  end
end
