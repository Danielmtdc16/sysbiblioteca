# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_10_07_192922) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "autors", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categores", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "configuracoes_sistemas", force: :cascade do |t|
    t.integer "prazo_dias"
    t.string "nome_sistema"
    t.float "valor_multa"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "editoras", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "leitors", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.string "telefone"
    t.string "email"
    t.string "tipo_leitor"
    t.string "matricula"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "livro_autors", force: :cascade do |t|
    t.bigint "livro_id", null: false
    t.bigint "autor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["autor_id"], name: "index_livro_autors_on_autor_id"
    t.index ["livro_id"], name: "index_livro_autors_on_livro_id"
  end

  create_table "livro_leitors", force: :cascade do |t|
    t.datetime "data_inicio"
    t.datetime "data_entrega"
    t.datetime "data_possivel_entrega"
    t.string "status"
    t.text "observacao"
    t.bigint "user_id", null: false
    t.bigint "livro_id", null: false
    t.bigint "leitor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["leitor_id"], name: "index_livro_leitors_on_leitor_id"
    t.index ["livro_id"], name: "index_livro_leitors_on_livro_id"
    t.index ["user_id"], name: "index_livro_leitors_on_user_id"
  end

  create_table "livros", force: :cascade do |t|
    t.string "nome"
    t.string "edicao"
    t.integer "qtd_paginas"
    t.integer "qtd_livros"
    t.text "descricao"
    t.bigint "editora_id", null: false
    t.bigint "categore_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["categore_id"], name: "index_livros_on_categore_id"
    t.index ["editora_id"], name: "index_livros_on_editora_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "livro_autors", "autors"
  add_foreign_key "livro_autors", "livros"
  add_foreign_key "livro_leitors", "leitors"
  add_foreign_key "livro_leitors", "livros"
  add_foreign_key "livro_leitors", "users"
  add_foreign_key "livros", "categores"
  add_foreign_key "livros", "editoras"
end
