class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :state
      t.monetize :amount, currency: { present: false }
      t.string :checkout_session_id
      t.references :basket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
