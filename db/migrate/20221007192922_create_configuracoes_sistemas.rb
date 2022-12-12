class CreateConfiguracoesSistemas < ActiveRecord::Migration[6.1]
  def change
    create_table :configuracoes_sistemas do |t|
      t.integer :prazo_dias
      t.integer :ativar_multa
      t.string :nome_sistema
      t.float :valor_multa

      t.timestamps
    end
  end
end
