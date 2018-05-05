class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :nombre, null: false
      t.string :lastName, null: false
      t.boolean :gender, null: false
      t.string :email, null: false
      t.belongs_to :role, null: false
      t.string :username, null: false
      t.string :password, null: false
      t.timestamps
    end
  end
end
