class CreatePpuTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :ppu_transactions do |t|
      t.string :original
      t.references :ppu_checkout, null: false, foreign_key: true
      t.decimal :payout

      t.timestamps
    end
  end
end
