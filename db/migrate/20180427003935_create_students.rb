class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.belongs_to :user, null: false, index: { unique: true }
      t.timestamps
    end
  end
end
