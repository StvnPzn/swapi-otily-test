class AddUrlToFilms < ActiveRecord::Migration[6.0]
  def change
    add_column :films, :url, :string
  end
end
