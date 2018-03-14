require 'rails_helper'

describe CommentsController, type: :controller do
  let(:product) {FactoryBot.create(:product)}
  let(:user) {FactoryBot.create(:user)}
  let(:admin) {FactoryBot.create(:admin)}
  


# ===================================

  describe 'POST #create' do

    context "is created succesfully by a loggedin user" do
      before do 
        sign_in user
        @comment = FactoryBot.create(:comment, user: user, product: product)
        product.comments << @comment
      end
      
      it "creates new comment" do 
      expect{
        post :create, params: { :comment => FactoryBot.attributes_for(:comment), 
                                :user_id => user.id,
                                :product_id => product.id}
        }.to change(Comment,:count).by(1)
      end

      it "redirects to product page and adds the new comment" do 
        expect(response).to be_ok
        expect(product.comments.reload.size >= 1).to eq(true)        
      end
    end


  end


  context 'DELETE #destroy' do 
    before do 
      sign_in admin
      @comment = FactoryBot.create(:comment, user: user, product: product)
      product.comments << @comment
    end
    it "allows admin to delete a product" do 
      delete :destroy, params: {
        product_id: product.id, id: product.comments.first.id
      }
      expect(response).to redirect_to product_path(product.id)
    end
  end 



end
