class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.string :title
      t.datetime :date
      t.string :description
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip_code
    end
  end
end
