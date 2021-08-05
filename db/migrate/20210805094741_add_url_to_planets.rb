class AddUrlToPlanets < ActiveRecord::Migration[6.0]
  def change
    add_column :planets, :url, :string
  end
end
