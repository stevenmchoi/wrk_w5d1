# require 'rails_helper'
#
# RSpec.describe SessionsController, type: :controller do
#   before(:each) do
#     User.create!(username: Faker::LordOfTheRings.character, password: 'abcdef')
#   end
#
#   describe "GET #new" do
#     it "returns http success" do
#       get :new
#       expect(response).to have_http_status(:success)
#     end
#
#     it 'renders new_users template' do
#       get :new
#       expect(response).to render_template(:new)
#     end
#   end
#
#   describe "POST #create" do
#     context 'with valid params' do
#       it 'signs the user in' do
#         post :create, params: { user:
#                                 { username: Faker::LordOfTheRings.character,
#                                   password: 'abcdef' } }
#         user = User.find_by(username: Faker::LordOfTheRings.character)
#         expect(session[:session_token]).to eq(user.session_token)
#       end
#
#       it 'redirects to links_url' do
#         post :create, params: { user:
#                                 { username: Faker::LordOfTheRings.character,
#                                   password: 'abcdef' } }
#         expect(response).to redirect_to(links_url)
#       end
#     end
#
#     context 'with invalid params' do
#       it 'validates credentials and renders new template with errors' do
#         post :create, params: { user:
#                                 { username: Faker::LordOfTheRings.character,
#                                   password: 'woiejfowijeo' } }
#         expect(response).to render(:new)
#         expect(flash[:errors]).to be_present
#       end
#     end
#   end
#
#   describe "GET #destroy" do
#     it "returns http success" do
#       delete :destroy
#       expect(response).to have_http_status(:success)
#     end
#
#     it 'logs the user out' do
#       delete :destroy, params: { user:
#                                 { username: Faker::LordOfTheRings.character,
#                                   password: 'woiejfowijeo' } }
#     end
#
#
#   end
#
# end
