require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:product) {FactoryBot.create(:product)}
  let(:user) {FactoryBot.build(:user)}



# ===================================

  describe 'POST #create:' do

    context "comment is created by a loggedin user" do
    before do 
      sign_in user
      product.comments << FactoryBot.create(:comment, user: user)
    end
    subject do 
      post :create, params: {
           product_id: product.id, user_id: user.id,
           comment: { body: 'this product is great', rating: 5 }
      }
    end
      it "returns to product show template and adds the comment" do 
        expect(response).to be_success
        expect(subject).to redirect_to product_path(product.id)
        expect(product.comments.reload.size >= 1).to eq(true)
      end
    end


  end


end
