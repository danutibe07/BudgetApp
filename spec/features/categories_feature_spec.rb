require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  describe 'GET #index' do
    it 'renders the index template' do
      sign_in user
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns categories belonging to the current user to @categories' do
      sign_in user
      get :index
      expect(assigns(:categories)).to eq(user.categories)
    end

    it 'redirects to the login page if the user is not authenticated' do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      sign_in user
      get :new
      expect(response).to render_template(:new)
    end

    it 'assigns a new Category instance to @category' do
      sign_in user
      get :new
      expect(assigns(:category)).to be_a_new(Category)
    end

    it 'redirects to the login page if the user is not authenticated' do
      get :new
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'POST #create' do
    context 'with invalid parameters' do
      it 'does not create a new category' do
        sign_in user
        expect {
          post :create, params: { category: { name: '', icon: 'test_icon.jpg' } }
        }.to_not change(Category, :count)
      end

      it 'renders the new template' do
        sign_in user
        post :create, params: { category: { name: '', icon: 'test_icon.jpg' } }
        expect(response).to render_template(:new)
      end
    end

    it 'redirects to the login page if the user is not authenticated' do
      post :create, params: { category: { name: 'Test Category', icon: 'test_icon.jpg' } }
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
