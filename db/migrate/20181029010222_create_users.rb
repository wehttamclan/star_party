class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :phone_number
      t.integer :zip_code
      t.string :password_digest
      t.integer :role, default: 0
    end
  end
end
