require 'rails_helper'

RSpec.describe Article, type: :model do

  context "is valid with a title, subline, teaser, body and image" do 

    let(:article) {FactoryBot.build(:article)}

    it "returns valid" do 
      expect(article).to be_valid
    end

  end

  context "is not valid without a title" do 

    let(:article) {FactoryBot.build(:article, title: nil)}

    it "returns invalid" do 
      expect(article).not_to be_valid
    end

  end


  context "is not valid without a subline" do 

    let(:article) {FactoryBot.build(:article, subline: nil)}

    it "returns invalid" do 
      expect(article).not_to be_valid
    end

  end


  context "is not valid without a teaser" do 

    let(:article) {FactoryBot.build(:article, teaser: nil)}
    
    it "returns invalid" do
      expect(article).not_to be_valid 
    end

  end


  context "is not valid without a body" do

    let(:article) {FactoryBot.build(:article, body: nil)}

    it "returns invalid" do 
     expect(article).not_to be_valid
    end

  end
 

  context "is valid without a article_image" do 

    let(:article) {FactoryBot.build(:article, article_image: nil)}

    it "returns valid" do 
      expect(article).to be_valid
    end

  end


  context "is invalid with a .raw image file" do 

    it "returns invalid" do 
      article = FactoryBot.build(:article_with_invalid_image)    
      expect(article).not_to be_valid
    end
  end


end
