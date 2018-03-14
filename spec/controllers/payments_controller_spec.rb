require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do

  

  describe "POST #create" do
  	context 'when a user is logged in' do
      let(:product) {FactoryBot.create(:product)}
	  before do
	    sign_in user
	    @product = product
	  end
	  it "returns http success" do
	    post :create, params: { :product_id => product.id }
	    expect(response).to have_http_status(:success)
	  end
    end
  end

end
