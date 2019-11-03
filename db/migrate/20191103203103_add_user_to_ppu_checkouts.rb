class AddUserToPpuCheckouts < ActiveRecord::Migration[6.0]
  def change
    add_reference :ppu_checkouts, :user, null: true, foreign_key: true
  end
end
