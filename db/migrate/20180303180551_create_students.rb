class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :surname
      t.string :adress
      t.string :mail

      t.timestamps
    end
  end
end
