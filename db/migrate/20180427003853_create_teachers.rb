class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.belongs_to :user, null: false, index: { unique: true }
      t.timestamps
    end
  end
end
