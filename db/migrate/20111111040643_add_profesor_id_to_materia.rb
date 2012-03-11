class AddProfesorIdToMateria < ActiveRecord::Migration
  def self.up
	add_column :materia, :profesor_id, :integer
  end

  def self.down
	remove_column :materia, :profesor_id
  end
end
