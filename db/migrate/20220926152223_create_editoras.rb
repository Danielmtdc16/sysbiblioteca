class CreateEditoras < ActiveRecord::Migration[6.1]
  def change
    create_table :editoras do |t|
      t.string :nome

      t.timestamps
    end
  end
end
