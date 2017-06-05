require "rails_helper"

RSpec.describe ServiceOrdersController, type: :controller do
  describe "POST create" do
    let(:params) do
      {
        service_order: {
          client_attributes: { name: 'client', key: 'one' },
          service_attributes: { name: 'service', value: 99 }
        }
      }
    end
    before(:each) do
      post :create, params: params
    end
    it "has a 201 status code" do
      expect(response.status).to eq(201)
    end
    it "responds to json format" do
      expect(response.content_type).to eq "application/json"
    end
    it "should return a success message" do
      expect(JSON.parse(response.body)["success"])
        .to eq('OS criada com sucesso!')
    end
    context 'when not sent params' do
      let(:params) do
        {
          service_order: {
            invalid: 'params'
          }
        }
      end
      it "has a 422 status code" do
        expect(response.status).to eq(422)
      end
      it "should return a failure message" do
        expect(JSON.parse(response.body)["failure"])
          .to eq('OS não pode ser criada, porfavor verifique seus dados.')
        expect(JSON.parse(response.body)["errors"])
          .to eq('client' => ['must exist'], 'service' => ['must exist'])
      end
    end
  end
end
