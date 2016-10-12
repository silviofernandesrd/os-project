require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  let(:described_class) { Client }
  subject { clients(:one) }

  describe Client, :associations do
    should have_many(:service_orders)
  end
end
