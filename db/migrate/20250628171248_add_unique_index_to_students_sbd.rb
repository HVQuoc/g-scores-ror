class AddUniqueIndexToStudentsSbd < ActiveRecord::Migration[8.0]
  def change
    add_index :students, :sbd, unique: true
  end
end
