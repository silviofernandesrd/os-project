class Service < ApplicationRecord
  has_many :service_orders

  validates :name, presence: true
end
