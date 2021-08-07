class CreateAllJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_table :films_planets do |t|
      t.references :film, foreign_key: true
      t.references :planet, foreign_key: true

      t.timestamps
    end

    create_table :films_starships do |t|
      t.references :film, foreign_key: true
      t.references :starship, foreign_key: true

      t.timestamps
    end

    create_table :films_vehicles do |t|
      t.references :film, foreign_key: true
      t.references :vehicle, foreign_key: true

      t.timestamps
    end

    create_table :chars_vehicles do |t|
      t.references :character, foreign_key: true
      t.references :vehicle, foreign_key: true

      t.timestamps
    end

    create_table :chars_starships do |t|
      t.references :character, foreign_key: true
      t.references :starship, foreign_key: true

      t.timestamps
    end
  end
end
