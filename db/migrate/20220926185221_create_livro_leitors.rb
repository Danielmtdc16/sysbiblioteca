class CreateLivroLeitors < ActiveRecord::Migration[6.1]
  def change
    create_table :livro_leitors do |t|
      t.datetime :data_inicio
      t.datetime :data_entrega
      t.datetime :data_possivel_entrega
      t.string :status
      t.text :observacao
      t.references :user, null: false, foreign_key: true
      t.references :livro, null: false, foreign_key: true
      t.references :leitor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
