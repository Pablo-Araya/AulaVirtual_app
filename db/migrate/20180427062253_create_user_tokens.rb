class CreateUserTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :user_tokens do |t|
      t.belongs_to :user, null: false
      t.string :token_security, null: false
      t.timestamps
    end
  end
end
