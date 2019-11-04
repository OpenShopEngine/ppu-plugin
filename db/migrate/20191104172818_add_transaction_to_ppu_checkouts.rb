class AddTransactionToPpuCheckouts < ActiveRecord::Migration[6.0]
  def change
    add_reference :ppu_checkouts, :ppu_transaction, null: true, foreign_key: true
  end
end
