require 'rails_helper'

describe User do 
  context "is not valid without an emailadress" do 
    it "returns invalid without an emailadress" do
      expect(User.new(password: "foobar")).not_to be_valid
    end
  end
  context "is not valid without a password" do 
    it "returns invalid without a password" do
      expect(User.new(email: "foo@bar.com")).not_to be_valid
    end
  end
  context "is not valid when a password has less then 6 characters" do 
    it "returns invalid if a password has less than 6 characters" do
      expect(User.new(email: "foo@bar.com", password: "foo")).not_to be_valid
    end
  end

end
