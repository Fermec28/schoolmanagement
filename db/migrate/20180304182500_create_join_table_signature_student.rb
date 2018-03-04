class CreateJoinTableSignatureStudent < ActiveRecord::Migration[5.1]
  def change
    create_join_table :signatures, :students do |t|
      # t.index [:signature_id, :student_id]
      # t.index [:student_id, :signature_id]
    end
  end
end
