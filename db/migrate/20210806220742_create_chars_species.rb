class CreateCharsSpecies < ActiveRecord::Migration[6.0]
  def change
    create_table :chars_species do |t|
      t.references :character, foreign_key: true
      t.references :specie, foreign_key: true

      t.timestamps
    end
  end
end
