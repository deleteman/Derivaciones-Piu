class CreateMateria < ActiveRecord::Migration
  def self.up
    create_table :materia do |t|
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :materia
  end
end
