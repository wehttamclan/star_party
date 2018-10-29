class AddHostToParties < ActiveRecord::Migration[5.2]
  def change
    add_reference :parties, :host, index: true, foreign_key: { to_table: :users }
  end
end
