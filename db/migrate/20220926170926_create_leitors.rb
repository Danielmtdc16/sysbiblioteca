class CreateLeitors < ActiveRecord::Migration[6.1]
  def change
    create_table :leitors do |t|
      t.string :nome
      t.string :cpf
      t.string :telefone
      t.string :email
      t.string :tipo_leitor
      t.string :matricula

      t.timestamps
    end
  end
end
