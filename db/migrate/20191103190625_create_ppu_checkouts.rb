class CreatePpuCheckouts < ActiveRecord::Migration[6.0]
  def change
    create_table :ppu_checkouts do |t|
      t.string :fullname
      t.string :email
      t.string :phone
      t.string :address
      t.string :products, array: true
      t.references :payment_system, null: false, foreign_key: true

      t.timestamps
    end
  end
end
