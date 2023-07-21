require 'rails_helper'

RSpec.describe RecordsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category, user: user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'renders the index template' do
      get :index, params: { category_id: category.id }
      expect(response).to render_template(:index)
    end

    it 'assigns the correct category to @category' do
      get :index, params: { category_id: category.id }
      expect(assigns(:category)).to eq(category)
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new, params: { category_id: category.id }
      expect(response).to render_template(:new)
    end

    it 'assigns a new Record instance to @record' do
      get :new, params: { category_id: category.id }
      expect(assigns(:record)).to be_a_new(Record)
    end
  end
end
