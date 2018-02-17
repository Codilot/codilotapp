require 'rails_helper'

RSpec.describe User, type: :model do 

  context "is valid with a first name, last name, email, and password" do
    it "returns valid" do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end
  end

  context "is valid with only an email and a password " do
    it "returns valid" do
      user = FactoryBot.build(:user,
                              first_name: nil,
                              last_name:  nil
                              )
      expect(user).to be_valid
    end
  end

  context "is invalid without an emailadress" do 
    it "returns invalid" do
      expect(FactoryBot.build(:user, email: nil)).not_to be_valid
    end
  end

  context "is invalid with a duplicate emailadress" do
    before do 
      FactoryBot.create(:user)
      @user = FactoryBot.build(:other_user, email: "john_doe@example.com")
    end
    it "returns invalid" do 
      @user.valid?
      expect(@user.errors[:email]).to include("has already been taken")
    end
  end

  context "is invalid without a password" do 
    it "returns invalid" do
      expect(FactoryBot.build(:user, password: nil)).not_to be_valid
    end
  end
  context "is invalid when a password has less then 6 characters" do 
    it "returns invalid" do
      expect(FactoryBot.build(:user, password:"oobar")).not_to be_valid
    end
  end
  
  context "returns a user's full name" do
    it "returns name as a string" do 
      user = FactoryBot.build(:user)
      expect(user.name).to eq "John Doe"
    end
  end

end
