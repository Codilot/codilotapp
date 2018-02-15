require 'rails_helper'

RSpec.describe UsersController, type: :controller do

   
  let(:user) {User.create!(
      email:      "john@example.com",
      password:   "foobar" 
    )}

   let(:other_user) {User.create!(
      email:      "jane@example.com",
      password:   "foobar" 
    )}

  describe 'GET #show' do 

    context 'when a user is logged in' do
      before do 
        sign_in user
      end
      it 'redirects to user show page' do
        get :show, params: {id: user.id}
        expect(assigns(:user)).to eq user
      end
    end

    context 'when a user is not logged in' do 
      it 'redirects to login' do 
       get :show, params: {id: user.id}
       expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when a user accesses the show page of an other user' do 
      before do 
        sign_in user
      end
      it 'redirects to landing page' do
        get :show, params: {id: other_user.id}
        expect(assigns(other_user)).not_to eq user
        expect(response).to redirect_to(root_path)
      end 
    end

  end
 


end
