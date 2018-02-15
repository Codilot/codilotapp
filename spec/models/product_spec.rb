require 'rails_helper'

RSpec.describe Product, type: :model do
  
  context "is not valid without a name" do 
    let(:product) {Product.new(teaser: "great new lamp", 
                               description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores e",
                               price: 200.50
    )}
    it "returns invalid without a name" do 
      expect(product).not_to be_valid
    end
  end

  context "is not valid without a teaser" do 
    let(:product) {Product.new(name: "lamp", 
                               description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores e",
                               price: 200.50
    )}
    it "returns invalid without a teaser" do 
      expect(product).not_to be_valid
    end
  end

  context "is not valid with a teaser of more than 40 characters" do 
    let(:product) {Product.new(name: "lamp",
                               teaser: "great new lamp that shines light and bright and extensively for a longer period of time", 
                               description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores e",
                               price: 200.50
    )}
    it "returns invalid when teaser has more than 40 characters" do 
      expect(product).not_to be_valid
    end
  end

  context "is not valid without a description" do 
    let(:product) {Product.new(name: "lamp", 
                               teaser: "great new lamp",
                               price: 200.50
    )}
    it "returns invalid without a description" do 
      expect(product).not_to be_valid
    end
  end

  context "is not valid with a description of less than 200 characters" do 
    let(:product) {Product.new(name: "lamp",
                               teaser: "great new lamp", 
                               description: "Too short description",
                               price: 200.50
    )}
    it "returns invalid when description has less than 200 characters" do 
      expect(product).not_to be_valid
    end
  end

  context "is not valid without a price" do 
    let(:product) {Product.new(name: "lamp", 
                               teaser: "great new lamp",
                               description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores e",
    )}
    it "returns invalid without a price" do 
      expect(product).not_to be_valid
    end
  end

  context "when product has comments" do
    let(:product) {Product.create!(name: "lamp", 
                                   teaser: "great new lamp", 
                                   description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores e",
                                   price: 200.50
    )}
    let(:user) {User.create!(first_name: "John",
                             last_name: "Doe",
                             email: "mail@example.com",
                             password: "foobar"
    )}
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
      @product1 = Product.create(name: "basic lamp", 
                                teaser: "great new lamp", 
                                description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores e",
                                price: 99.99
                                )
      @product2 = Product.create(name: "basic lamp hood", 
                                teaser: "hood of the basic lamp", 
                                description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores e",
                                price: 9.99
                                )
      @product3 = Product.create(name: "different lamp", 
                                teaser: "a whole different lamp", 
                                description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores e",
                                price: 199.99
                                )    
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


