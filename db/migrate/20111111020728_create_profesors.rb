class CreateProfesors < ActiveRecord::Migration
  def self.up
    create_table :profesors do |t|
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :profesors
  end
end
