class AddYearToDerivacion < ActiveRecord::Migration
  def self.up
    add_column :derivacions, :year, :integer
  end

  def self.down
    remove_column :derivacions, :year
  end
end
