require 'test_helper'

class ServiceOrderTest < ActiveSupport::TestCase
  let(:described_class) { ServiceOrder }
  subject { service_orders(:one) }

  describe ServiceOrder, :associations do
    should belong_to(:client)
    should belong_to(:service)
  end
end
