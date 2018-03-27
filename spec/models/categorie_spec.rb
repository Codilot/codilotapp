require 'rails_helper'

describe Categorie do 

	context "is valid with a name" do 

     let(:categorie) {FactoryBot.build(:categorie)}

      it "returns valid" do 
        expect(categorie).to be_valid
      end

	end
	
end
