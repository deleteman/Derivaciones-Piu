class ChangeHorarioMaterium < ActiveRecord::Migration
  def self.up
	change_column :horario_materia, :dia, :date
  end

  def self.down
	change_column :horario_materia, :dia, :string
  end
end
