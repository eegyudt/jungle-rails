require 'rails_helper'

RSpec.describe User, type: :model do
    
  describe 'Validations' do

    it "is a valid user" do
      user = User.create(first_name: "Red", last_name: "Ridinghood", email:  "test@test.com", password: "password", password_confirmation: "password")
      expect(user).to be_valid
    end

    it "should have a first name" do
      user = User.create(first_name: nil, last_name: "Ridinghood", email:  "test@test.com", password: "password", password_confirmation: "password")
      expect(user).to be_invalid
    end

    it "should have a last name" do
      user = User.create(first_name: "Red", last_name: nil, email:  "test@test.com", password: "password", password_confirmation: "password")
      expect(user).to be_invalid
    end

    it "should have an email" do
      user = User.create(first_name: "Red", last_name: "Ridinghood", email:  nil, password: "password", password_confirmation: "password")
      expect(user).to be_invalid
    end

    it "should have an password" do
      user = User.create(first_name: "Red", last_name: "Ridinghood", email:  "test@test.com", password: nil, password_confirmation: "password")
      expect(user).to be_invalid
    end

    it "should have an password confirmation" do
      user = User.create(first_name: "Red", last_name: "Ridinghood", email:  "test@test.com", password: "password", password_confirmation: nil)
      expect(user).to_not be_valid
    end

    it "should have matching passwords" do
      user = User.create(first_name: 'Red', last_name: "Ridinghood", email:  "test@test.com", password: "password", password_confirmation: "password")
      expect(user.password).to eq(user.password_confirmation)
    end

    it "should have a unique email" do
      user1 = User.create(first_name: 'Red', last_name: "Ridinghood", email:  "test@test.com", password: "password", password_confirmation: "password")
      user2 = User.create(first_name: 'Red', last_name: "Ridinghood", email:  "TEST@test.com", password: "password", password_confirmation: "password")
      expect(user2).to_not be_valid
    end

    it "should have an password of at least 5 characters" do
      user = User.create(first_name: "Red", last_name: "Ridinghood", email:  "test@test.com", password: "password", password_confirmation: "pass")
      expect(user).to_not be_valid
    end
  end
  
  describe '.authenticate_with_credentials' do

    it "should authenticate if email and password are valid" do
      user = User.create(first_name: "Red", last_name: "Ridinghood", email: "test@test.com", password: "password", password_confirmation:"password")
      authenticate = User.authenticate_with_credentials(user.email, user.password)
      expect(authenticate).to eq(user)
    end

    it "should have a valid email address if space is added" do
      user = User.create(first_name: "Red", last_name: "Ridinghood", email: "test@test.com", password: "password", password_confirmation:"password")
      authenticate = User.authenticate_with_credentials("  test@test.com ",user.password)
      expect(authenticate).to eq(user)
    end

    it "should have a valid email address regardless of case" do
      user = User.create(first_name: "Red", last_name: "Ridinghood", email: "test@test.com", password: "password", password_confirmation:"password")
      authenticate = User.authenticate_with_credentials("TEST@TEST.COM", user.password)
      expect(authenticate).to eq(user)
    end
  end
end