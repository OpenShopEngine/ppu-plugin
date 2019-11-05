module Ppu
  class Checkout < ApplicationRecord
    belongs_to :payment_system, class_name: "PaymentSystem"
    belongs_to :user, class_name: "User", optional: true
    belongs_to :ppu_transaction, class_name: "Ppu::Transaction", optional: true
  end
end
