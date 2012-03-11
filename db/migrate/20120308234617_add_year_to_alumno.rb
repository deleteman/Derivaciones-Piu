class AddYearToAlumno < ActiveRecord::Migration
  def self.up
    add_column :alumnos, :year, :integer
  end

  def self.down
    remove_column :alumnos, :year
  end
end
