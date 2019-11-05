class AddStatusToPpuCheckouts < ActiveRecord::Migration[6.0]
  def change
    add_column :ppu_checkouts, :status, :string
  end
end
