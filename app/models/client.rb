class Client < ApplicationRecord
  has_many :service_orders

  validates :name, presence: true
  validates :key, presence: true
end
