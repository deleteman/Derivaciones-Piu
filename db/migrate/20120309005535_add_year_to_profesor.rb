class AddYearToProfesor < ActiveRecord::Migration
  def self.up
    add_column :profesors, :year, :integer
  end

  def self.down
    remove_column :profesors, :year
  end
end
