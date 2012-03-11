class CreateAlumnos < ActiveRecord::Migration
  def self.up
    create_table :alumnos do |t|
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :alumnos
  end
end
