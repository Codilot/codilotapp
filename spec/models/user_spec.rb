require 'rails_helper'

describe User do 
  
  it "is valid with a first name, last name, email, and password" do
    user = User.new(
      first_name: "Jane",
      last_name:  "Doe",
      email:      "john@example.com",
      password:   "foobar",
      )
    expect(user).to be_valid
  end

  context "is invalid without an emailadress" do 
    it "returns invalid without an emailadress" do
      expect(User.new(password: "foobar")).not_to be_valid
    end
  end
  context "is invalid without a password" do 
    it "returns invalid without a password" do
      expect(User.new(email: "foo@bar.com")).not_to be_valid
    end
  end
  context "is invalid when a password has less then 6 characters" do 
    it "returns invalid if a password has less than 6 characters" do
      expect(User.new(email: "foo@bar.com", password: "foo")).not_to be_valid
    end
  end

  it "is invalid with a duplicate email address" do 
    User.create(
      first_name: "Jane",
      last_name: "Doe",
      email: "j.doe@example.com",
      password: "foobar"
    )
    user = User.new(
      first_name: "Joe",
      last_name: "Doe",
      email: "j.doe@example.com",
      password: "foobar"
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
  
  it "returns a user's full name as a string" do 
    user = User.new(
      first_name: "John",
      last_name: "Doe",
      email: "j.doe@example.com",
      password: "foobar"
    )
    expect(user.name).to eq "John Doe"
  end

end
