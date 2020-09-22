class Order < ApplicationRecord
  belongs_to :basket
  monetize :amount_cents
end
