class AddDeveloperAndDivisionToAssets < ActiveRecord::Migration[5.0]
  def change
    add_reference :documents, :developer, foreign_key: true
    add_reference :documents, :division, foreign_key: true
    add_reference :documents, :development, foreign_key: true

    add_reference :finishes, :developer, foreign_key: true
    add_reference :finishes, :division, foreign_key: true
    add_reference :finishes, :development, foreign_key: true

    add_reference :images, :developer, foreign_key: true
    add_reference :images, :division, foreign_key: true
    add_reference :images, :development, foreign_key: true

    add_reference :plots, :developer, foreign_key: true
    add_reference :plots, :division, foreign_key: true
    add_reference :plots, :development, foreign_key: true

    add_reference :phases, :developer, foreign_key: true
    add_reference :phases, :division, foreign_key: true

    add_reference :rooms, :developer, foreign_key: true
    add_reference :rooms, :division, foreign_key: true
    add_reference :rooms, :development, foreign_key: true

    add_reference :unit_types, :developer, foreign_key: true
    add_reference :unit_types, :division, foreign_key: true
    add_reference :unit_types, :development, foreign_key: true
  end
end
