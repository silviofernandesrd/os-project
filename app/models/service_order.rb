class ServiceOrder < ApplicationRecord
  belongs_to :client
  belongs_to :service

  accepts_nested_attributes_for :client, :service
end
