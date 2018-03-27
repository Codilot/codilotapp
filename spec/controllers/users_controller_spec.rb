require 'rails_helper'

describe UsersController, type: :controller do

   
  let(:user) {FactoryBot.create(:user)}

  let(:other_user) {FactoryBot.create(:other_user)}

  let(:admin) {FactoryBot.create(:admin)}



  describe 'GET #index' do 

    context 'when a logged in user is an admin' do

      before do 
        sign_in admin
      end

      it 'renders the index template' do
        get :index
        expect(response).to be_ok
        expect(response).to render_template('index')
      end

    end


    context 'when a user is not an admin'

      before do 
        sign_in user
      end

    it 'redirects to root' do 
      get :index
      expect(response).not_to be_ok
      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to include("admin only")
    end

  end 



  describe 'GET #show' do 

    context 'when a user is logged in' do

      before do 
        sign_in user
      end

      it 'redirects to user show page' do
        get :show, params: {id: user.id}
        expect(assigns(:user)).to eq user
        expect(response).to be_ok
        expect(response).to render_template('show')
      end

    end


    context 'when an admin is logged in' do

      before do 
        sign_in admin
      end

      it 'redirects to user show page' do
        get :show, params: {id: other_user.id}
        expect(assigns(other_user)).not_to eq admin
        expect(response).to be_ok
        expect(response).to render_template('show')
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
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end 

    end

  end



  describe 'GET #new' do 

    context 'when a user is logged in' do 

      before do 
        sign_in user
      end

      it 'redirects to root' do
        get :new
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to include("admin only")
      end

    end


    context 'when a user is not logged in' do 

      it 'renders the sign_up template' do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end

    end


    context 'when a admin is logged in' do 

      before do 
        sign_in admin
      end

      it 'redirects to root' do
        get :new
        expect(response).to be_ok
        expect(response).to render_template('new')
      end

    end

  end
   


  describe 'POST #create' do 

    context "creates a User" do 

      before do 
        new_user =  FactoryBot.create(:new_user)
        sign_in new_user
      end

      it "sends devise confirmation instructions" do
        expect(response).to be_ok
        expect(response).to render_template('devise/mailer/confirmation_instructions')
      end

    end

  end



  describe 'GET #edit' do 

    context 'when a user is logged in' do

      before do 
        sign_in user
      end

      it 'redirects to user edit page' do
        get :edit, params: {id: user.id}
        expect(assigns(:user)).to eq user
        expect(response).to be_ok
        expect(response).to render_template('edit')
      end

    end

  end



  describe 'PATCH #update' do 

    context 'when a user is logged in' do

      before do 
        sign_in user
         @update = {  first_name: user.first_name, 
                      last_name: "Updated Last Name", 
                      email: user.email, 
                      password: user.password, 
                      admin: user.admin, 
                      id: user.id 
                    }
      end

      it 'succesfully updates the user record' do 
        patch :update, params: { id: user.id, user: @update }
        user.reload
        expect(user.last_name).to eq "Updated Last Name"
      end

    end

  end



  describe 'DELETE #destroy' do 

    context 'allows user to delet its user record' do 

      before do 
        sign_in user
      end

      it "redirects to users_path" do 
        delete :destroy, params: {id: user.id}
        expect(response).to redirect_to(users_path)
      end
      
      it "raises an exception when reloading the record" do 
        delete :destroy, params: {id: user.id}
        expect { user.reload }.to raise_exception(ActiveRecord::RecordNotFound)
      end

    end


  end


end
