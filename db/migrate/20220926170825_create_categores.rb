class CreateCategores < ActiveRecord::Migration[6.1]
  def change
    create_table :categores do |t|
      t.string :nome

      t.timestamps
    end
  end
end
