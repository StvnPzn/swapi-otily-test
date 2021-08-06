class CreateFilms < ActiveRecord::Migration[6.0]
  def change
    create_table :films, { id: false } do |t|
      t.integer :id, primary_key: true
      t.string :title
      t.integer :episode_num
      t.text :opening_crawl
      t.string :director
      t.string :producer
      t.string :release_date

      t.timestamps
    end
  end
end
