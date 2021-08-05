class CreateDataImportations < ActiveRecord::Migration[6.0]
  def change
    create_table :data_importations do |t|

      t.timestamps
    end
  end
end
