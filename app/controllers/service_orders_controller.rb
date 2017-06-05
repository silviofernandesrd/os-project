class ServiceOrdersController < ApplicationController
  # POST /service_orders
  def create
    @service_order = ServiceOrder.new(service_order_params)
    if @service_order.save
      render json: { key: @service_order.id,
                     success: 'OS criada com sucesso!' }, status: 201
    else
      render json: {
        failure: 'OS não pode ser criada, porfavor verifique seus dados.',
        errors: @service_order.errors
      }, status: 422
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def service_order_params
    params.require(:service_order).permit(
      client_attributes: [:name, :key], service_attributes: [:name, :value]
    )
  end
end
