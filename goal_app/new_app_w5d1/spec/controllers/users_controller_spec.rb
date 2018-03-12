require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'renders new_users template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'signs the user in' do
        params = { user: { username: Faker::LordOfTheRings.character,
                           password: 'abcdef' } }
        post :create, params: params
        user = User.find_by(username: params[:user][:username])
        expect(session[:session_token]).to eq(user.session_token)
      end

      it 'redirects to links_url' do
        post :create, params: { user:
                                { username: Faker::LordOfTheRings.character,
                                  password: 'abcdef' } }
        expect(response).to redirect_to(links_url)
      end
    end

    context 'with invalid params' do
      it 'validates the presence of password and \
        renders new template with errors' do
        post :create, params: { user:
                                { username: Faker::LordOfTheRings.character,
                                  password: '' } }
        expect(response).to render(:new)
        expect(flash[:errors]).to be_present
      end
    end
  end

end
