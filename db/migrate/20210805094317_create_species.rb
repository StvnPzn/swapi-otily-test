class CreateSpecies < ActiveRecord::Migration[6.0]
  def change
    create_table :species, { id: false } do |t|
      t.integer :id, primary_key: true
      t.string :name
      t.string :classification
      t.string :designation
      t.integer :average_height
      t.string :skin_colors
      t.string :hair_colors
      t.string :eye_colors
      t.integer :average_lifespan
      t.string :language
      t.string :url

      t.timestamps
    end
  end
end
