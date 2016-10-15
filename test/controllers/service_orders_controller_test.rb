require 'test_helper'

class ServiceOrdersControllerTest < ActionDispatch::IntegrationTest
  let(:url) do
    "/service_orders"
  end
  describe :create do
    let(:params_service_order) do
      { service_order: {
        client_attributes: { name: 'Cliente Teste 1' },
        service_attributes: { name: 'Serviço Teste 1', value: 10.0 }
      } }
    end
    it 'with valid params' do
      post(url, params: params_service_order)
      assert_response 201
      json = JSON.parse(response.body)
      assert_equal 'OS criada com sucesso!', json['success']
    end
    it 'provides key of service order after created' do
      post(url, params: params_service_order)
      last_created = ServiceOrder.last
      json = JSON.parse(response.body)
      assert_equal last_created.id, json['key']
    end
    describe 'with invalid params' do
      before(:each) do
        @invalid_params = params_service_order.dup
      end

      it 'without client attributes' do
        @invalid_params[:service_order].delete(:client_attributes)
        post(url, params: @invalid_params)
        assert_response 422
        json = JSON.parse(response.body)
        assert_equal 'OS não pode ser criada, porfavor verifique seus dados.',
                     json['failure']
        assert_equal ['must exist'], json['errors']['client']
      end

      it 'without service attributes' do
        @invalid_params[:service_order].delete(:service_attributes)
        post(url, params: @invalid_params)
        assert_response 422
        json = JSON.parse(response.body)
        assert_equal 'OS não pode ser criada, porfavor verifique seus dados.',
                     json['failure']
        assert_equal ['must exist'], json['errors']['service']
      end
    end
  end
end
