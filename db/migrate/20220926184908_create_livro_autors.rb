class CreateLivroAutors < ActiveRecord::Migration[6.1]
  def change
    create_table :livro_autors do |t|
      t.references :livro, null: false, foreign_key: true
      t.references :autor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
