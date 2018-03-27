require 'rails_helper'

describe Comment do 

  context "is valid with user, product, body and rating" do
    let(:comment) {FactoryBot.build(:comment)}

    it "returns valid" do 
     expect(comment).to be_valid 
    end

  end


  context "is invalid without a user_id" do

    let(:comment) {FactoryBot.build(:comment, user_id: nil)}

    it "returns invalid" do 
      expect(comment).not_to be_valid
    end  

  end


  context "is invalid without a product_id" do

    let(:comment) {FactoryBot.build(:comment, product_id: nil)}

    it "returns invalid" do 
     expect(comment).not_to be_valid
    end

  end


  context "is invalid without a body" do

    let(:comment) {FactoryBot.build(:comment, body: nil)}

    it "returns invalid" do 
     expect(comment).not_to be_valid
    end

  end


  context "is invalid without a rating" do

    let(:comment) {FactoryBot.build(:comment, rating: nil)}

    it "returns invalid" do
      expect(comment).not_to be_valid
    end

  end


  context "rating is not an integer" do

    let(:comment) {FactoryBot.build(:comment, rating: "not a number")}

    it "returns invalid" do
      expect(comment).not_to be_valid
    end
    
  end


end
