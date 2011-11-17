class CreateDerivacions < ActiveRecord::Migration
  def self.up
    create_table :derivacions do |t|
      t.integer :alumno_id
      t.integer :materia_id

      t.timestamps
    end
  end

  def self.down
    drop_table :derivacions
  end
end
