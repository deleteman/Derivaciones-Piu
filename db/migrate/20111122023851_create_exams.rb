class CreateExams < ActiveRecord::Migration
  def self.up
    create_table :exams do |t|
      t.integer :materia_id
      t.date :fecha
      t.time :hora

      t.timestamps
    end
  end

  def self.down
    drop_table :exams
  end
end
