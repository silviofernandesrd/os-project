require 'test_helper'

class ServiceOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @service_order = service_orders(:one)
  end

  test "should get index" do
    get service_orders_url, as: :json
    assert_response :success
  end

  test "should create service_order" do
    assert_difference('ServiceOrder.count') do
      post service_orders_url, params: { service_order: { client_id: @service_order.client_id, service_id: @service_order.service_id } }, as: :json
    end

    assert_response 201
  end

  test "should show service_order" do
    get service_order_url(@service_order), as: :json
    assert_response :success
  end

  test "should update service_order" do
    patch service_order_url(@service_order), params: { service_order: { client_id: @service_order.client_id, service_id: @service_order.service_id } }, as: :json
    assert_response 200
  end

  test "should destroy service_order" do
    assert_difference('ServiceOrder.count', -1) do
      delete service_order_url(@service_order), as: :json
    end

    assert_response 204
  end
end
