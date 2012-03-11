class AddYearToExam < ActiveRecord::Migration
  def self.up
    add_column :exams, :year, :integer
  end

  def self.down
    remove_column :exams, :year
  end
end
