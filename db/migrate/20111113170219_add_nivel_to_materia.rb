class AddNivelToMateria < ActiveRecord::Migration
  def self.up
    add_column :materia, :nivel, :integer
  end

  def self.down
    remove_column :materia, :nivel
  end
end
