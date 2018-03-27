require 'rails_helper'

RSpec.describe Product, type: :model do

  context "is valid with a name, teaser, description and price" do 

    let(:product) {FactoryBot.build(:product)}

    it "returns valid" do 
      expect(product).to be_valid
    end

  end
  

  context "is not valid without a name" do 

    let(:product) {FactoryBot.build(:product, name: nil)}

    it "returns invalid" do 
      expect(product).not_to be_valid
    end

  end

 
  context "is not valid without a teaser" do 

    let(:product) {FactoryBot.build(:product, teaser: nil)}

    it "returns invalid" do 
      expect(product).not_to be_valid
    end

  end


  context "is not valid with a teaser of more than 40 characters" do 

    let(:product) {FactoryBot.build(
      :product, 
      teaser: "great new lamp that shines light and bright and extensively for a longer period of time"
    )}

    it "returns invalid when teaser has more than 40 characters" do 
      expect(product).not_to be_valid
    end

  end


  context "is not valid without a description" do 

    let(:product) {FactoryBot.build(:product, description: nil)}

    it "returns invalid without a description" do 
      expect(product).not_to be_valid
    end

  end


  context "is not valid with a description of less than 200 characters" do 

    let(:product) {FactoryBot.build(:product, description: "Too short description")}

    it "returns invalid" do 
      expect(product).not_to be_valid
    end

  end


  context "is not valid without a price" do 

    let(:product) {FactoryBot.build(:product, price: nil)}

    it "returns invalid without a price" do 
      expect(product).not_to be_valid
    end

  end


  context "when product has comments" do

    let(:product) {FactoryBot.create(:product)}
    let(:user) {FactoryBot.create(:user)}

    before do
      product.comments.create!(rating: 1, user: user, body: "bad product")
      product.comments.create!(rating: 3, user: user, body: "ok product")
      product.comments.create!(rating: 5, user: user, body: "good product")
    end  

    it "returns the average rating of all comments" do 
      expect(product.average_rating).to eq(3)
    end 

  end 


  describe "search products for a searchterm" do 

    before do
      @product1 = FactoryBot.create(:search_product_one)
      @product2 = FactoryBot.create(:search_product_two)
      @product3 = FactoryBot.create(:product)   
    end

    context "when a match is found" do

      it "returns products that match the search term" do 
        expect(Product.search("basic")).to include(@product1, @product2)
        expect(Product.search("basic")).not_to include(@product3)
      end

    end

    context "when no match is found" do

      it "returns an empty collection" do 
        expect(Product.search("xxx")).to be_empty
      end

    end
    

  end


end


