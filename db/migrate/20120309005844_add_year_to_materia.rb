class AddYearToMateria < ActiveRecord::Migration
  def self.up
    add_column :materia, :year, :integer
  end

  def self.down
    remove_column :materia, :year
  end
end
