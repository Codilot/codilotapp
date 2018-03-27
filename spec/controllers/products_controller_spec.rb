require 'rails_helper'

describe ProductsController, type: :controller do

  let(:admin) {FactoryBot.create(:admin)}
  let(:product) {FactoryBot.create(:product)}
  
  
  context 'GET #index' do

    it 'renders the index page' do 
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end

  end


  context 'GET #show' do

    it 'renders the show page' do 
      get :show, params: {id: product.id}
      expect(response).to be_ok
      expect(response).to render_template('show')
    end

  end  


  describe 'POST #create' do

    context "is created succesfully by a admin" do

      before do 
        sign_in admin   
      end

      it "creates new product" do 
        expect{
          post :create, params: { product: FactoryBot.attributes_for(:product) }
          }.to change(Product,:count).by(1)
      end

    end


    context "product data is invalid" do

      before do 
        sign_in admin
      end

      it "does not create new product" do 

        expect{
          post :create, params: { product: FactoryBot.attributes_for(:product, teaser: nil) }
          }.to change(Product,:count).by(0)
      end

      it "renders the new template" do
        post :create, params: { product: FactoryBot.attributes_for(:product, teaser: nil) } 
        expect(response).to render_template('new')
      end

    end

  end

  
  context 'PATCH #update' do

    before do 
      sign_in admin
      @update = { name: product.name, image_url: product.image_url, id: product.id, price: product.price, colour: "blue"}
    end

    it "successfully updates a product" do
      patch :update, params: { id: product.id, product: @update}
      product.reload
      expect(product.colour).to eq "blue"
    end

  end

  context 'DELETE #destroy' do 

    before do 
      sign_in admin
    end

    it "allows admin to delete a product" do 
      delete :destroy, params: {id: product.id}
      expect(response).to redirect_to products_path
    end

  end 


end