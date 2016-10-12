require 'test_helper'

class ServiceTest < ActiveSupport::TestCase
  let(:described_class) { Service }
  subject { services(:one) }

  describe Service, :associations do
    should have_many(:service_orders)
  end
end
