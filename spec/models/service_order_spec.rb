require "rails_helper"

RSpec.describe ServiceOrder, type: :model do
  it { should belong_to(:service) }
  it { should belong_to(:client) }
  it { should accept_nested_attributes_for(:service) }
  it { should accept_nested_attributes_for(:client) }
end
