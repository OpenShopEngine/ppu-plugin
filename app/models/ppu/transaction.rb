module Ppu
  class Transaction < ApplicationRecord
    belongs_to :ppu_checkout, class_name: "Ppu::Checkout"
  end
end
