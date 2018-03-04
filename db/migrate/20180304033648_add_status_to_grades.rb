class AddStatusToGrades < ActiveRecord::Migration[5.1]
  def change
    add_column :grades, :status, :boolean
  end
end
