class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters, { id: false } do |t|
      t.integer :id, primary_key: true
      t.string :name
      t.integer :height
      t.integer :mass
      t.string :hair_color
      t.string :skin_color
      t.string :eye_color
      t.string :birth_year
      t.string :gender
      t.string :url

      t.timestamps
    end
  end
end
