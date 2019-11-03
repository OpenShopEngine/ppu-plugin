module Ppu
  class Checkout < ApplicationRecord
    belongs_to :payment_system, class_name: "PaymentSystem"
  end
end
