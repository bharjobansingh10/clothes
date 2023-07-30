class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_items, dependent: :destroy
    has_one :payment

    enum status: { created: 0, placed: 1, paid: 2, cancel: 3 }, _prefix: :type
    enum payment_method: { online_payment: 0, cash_on_delivery: 1 }
end
