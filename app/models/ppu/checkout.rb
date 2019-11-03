module Ppu
  class Checkout < ApplicationRecord
    belongs_to :payment_system, class_name: "PaymentSystem"
    belongs_to :user, class_name: "User"
  end
end
