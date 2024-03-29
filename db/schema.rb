# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120311203345) do

  create_table "alumnos", :force => true do |t|
    t.string    "nombre"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "year"
  end

  create_table "derivacions", :force => true do |t|
    t.integer   "alumno_id"
    t.integer   "materia_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "year"
  end

  create_table "exams", :force => true do |t|
    t.integer   "materia_id"
    t.date      "fecha"
    t.time      "hora"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "year"
  end

  create_table "horario_materia", :force => true do |t|
    t.integer   "materia_id"
    t.time      "desde"
    t.time      "hasta"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.date      "dia"
  end

  create_table "materia", :force => true do |t|
    t.string    "nombre"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "profesor_id"
    t.integer   "nivel"
    t.integer   "year"
  end

  create_table "profesors", :force => true do |t|
    t.string    "nombre"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "year"
  end

  create_table "users", :force => true do |t|
    t.string    "email",                                 :default => "",    :null => false
    t.string    "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string    "reset_password_token"
    t.timestamp "reset_password_sent_at"
    t.timestamp "remember_created_at"
    t.integer   "sign_in_count",                         :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.boolean   "approved",                              :default => false, :null => false
  end

  add_index "users", ["approved"], :name => "index_users_on_approved"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
