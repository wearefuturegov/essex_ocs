require 'rails_helper'

describe ResponsesController, type: :controller do

  describe 'create' do
    let(:response) { Response.last }
    before { post :create, params: { response: { category: 'some_category' } } }

    it 'creates a response' do
      expect(Response.count).to eq(1)
    end

    it 'sets a category' do
      expect(response.category).to eq('some_category')
    end
  end

  describe 'update' do
    let(:response) { Response.create(category: 'some_category') }
    before { put :update, params: { id: response.id, response: { payment_options: %w[thing_1 thing_2] } } }

    it 'updates the response' do
      response.reload
      expect(response.payment_options).to eq(%w[thing_1 thing_2])
    end

  end

end
