class AddTrackNumberToPpuCheckouts < ActiveRecord::Migration[6.0]
  def change
    add_column :ppu_checkouts, :track_number, :string
  end
end
