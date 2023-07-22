require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  let(:user) { instance_double(User) }

  describe 'POST /categories' do
    context 'with valid attributes' do
      before do
        allow(user).to receive(:categories).and_return([])
        allow(controller).to receive(:current_user).and_return(user)
      end
    end

    context 'with invalid attributes' do
      before do
        allow(user).to receive(:categories).and_return([])
        allow(controller).to receive(:current_user).and_return(user)
      end
    end
  end

  describe 'DELETE /categories/:id' do
    before do
      allow(user).to receive(:categories).and_return([])
      allow(controller).to receive(:current_user).and_return(user)
    end
  end
end
