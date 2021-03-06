class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name, null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false
      t.index [:user_name], unique: true
      t.index [:session_token], unique: true
      t.timestamp 
    end
  end
end
