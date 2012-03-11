class ChangeHorarioMaterium < ActiveRecord::Migration
  def self.up
	remove_column :horario_materia, :dia
	add_column :horario_materia, :dia, :date
  end

  def self.down
	remove_column :horario_materia, :dia
	add_column :horario_materia, :dia, :string
  end
end
