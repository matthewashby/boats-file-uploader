class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :email, null: false
      t.string :address_1, null: false
      t.integer :service_id, null: false
      t.string :address_2
      t.string :town, null: false
      t.string :postal_code, null: false
      t.string :country, null: false
      t.string :payment_intent_id
      t.datetime :paid_at

      t.timestamps
    end
  end
end
