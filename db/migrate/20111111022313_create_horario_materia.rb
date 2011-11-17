class CreateHorarioMateria < ActiveRecord::Migration
  def self.up
    create_table :horario_materia do |t|
      t.integer :materia_id
      t.string :dia
      t.time :desde
      t.time :hasta

      t.timestamps
    end
  end

  def self.down
    drop_table :horario_materia
  end
end
