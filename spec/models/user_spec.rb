require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it "should have a matching password and password_confirmation" do
      @user = User.new(id: 1, first_name: 'Dude', last_name: 'Dudes', email: "dude@g.com", password: 'baluTheBear', password_confirmation: "baluTheBear")
      expect(@user).to be_valid
    end

    it "should have a matching password and password_confirmation" do
      @user = User.new(id: 1, first_name: 'Dude', last_name: 'Dudes', email: "dude@g.com", password: 'baluTheBear', password_confirmation: "baluTheBears")
      expect(@user).to_not be_valid
    end

    it "should have a password and password_confirmation filled out" do
      @user = User.new(id: 1, first_name: 'Dude', last_name: 'Dudes', email: "dude@g.com", password: nil, password_confirmation: nil)
      expect(@user).to_not be_valid
    end

    it "should have a unique email" do
      # create! replace User.new and @user.save() 
      @user = User.create!(id: 1, first_name: 'Dude', last_name: 'Dudes', email: "dude@g.com", password: 'baluTheBear', password_confirmation: "baluTheBear")
      @user1 = User.new(id: 2, first_name: 'Dude1', last_name: 'Dudes1', email: "DUDE@G.com", password: 'baluTheBear', password_confirmation: "baluTheBear")
      expect(@user1).to_not be_valid
      
    end

    it "should not have an empty first_name field" do
      @user = User.new(id: 1, first_name: nil, last_name: 'Dudes', email: "dude@g.com", password: 'baluTheBear', password_confirmation: "baluTheBear")
      expect(@user).to_not be_valid
    end

    it "should not have an empty last_name field" do
      @user = User.new(id: 1, first_name: 'Dude', last_name: nil, email: "dude@g.com", password: 'baluTheBear', password_confirmation: "baluTheBear")
      expect(@user).to_not be_valid
    end

    it "should not have an empty email field" do
      @user = User.new(id: 1, first_name: 'Dude', last_name: 'Dudes', email: nil, password: 'baluTheBear', password_confirmation: "baluTheBear")
      expect(@user).to_not be_valid
    end

    it "should not have a password with length less than 5" do
      @user = User.new(id: 1, first_name: 'Dude', last_name: 'Dudes', email: "dude@g.com", password: 'bal', password_confirmation: "bal")
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it "should accept an email field with trailing or leading spaces" do
      @user = User.create!(id: 1, first_name: 'Dude', last_name: 'Dudes', email: "dude@g.com", password: 'baluTheBear', password_confirmation: "baluTheBear")
      @email = " dude@g.com "
      @pass = 'baluTheBear'
      @user1 = User.authenticate_with_credentials(@email, @pass)
      expect(@user[:email]).to eq(@user1[:email])
    end

    it "should accept a different case email" do
      @user = User.create!(id: 1, first_name: 'Dude', last_name: 'Dudes', email: "dude@g.com", password: 'baluTheBear', password_confirmation: "baluTheBear")
      @email = "DUDE@g.com"
      @pass = 'baluTheBear'
      @user1 = User.authenticate_with_credentials(@email, @pass)
      expect(@user[:email]).to eq(@user1[:email])
    end


    it "should not accept an incorrect email with a valid password" do
      @user = User.create!(id: 1, first_name: 'Dude', last_name: 'Dudes', email: "dude@g.com", password: 'baluTheBear', password_confirmation: "baluTheBear")
      @email = "dude2@g.com"
      @pass = 'baluTheBear'
      @user1 = User.authenticate_with_credentials(@email, @pass)
      expect(@user1).to eq(nil)
    end

    it "should not accept an incorrect password with a vaild email" do
      @user = User.create!(id: 1, first_name: 'Dude', last_name: 'Dudes', email: "dude@g.com", password: 'baluTheBear', password_confirmation: "baluTheBear")
      @email = "dude@g.com"
      @pass = 'baluTheBearsssss'
      @user1 = User.authenticate_with_credentials(@email, @pass)
      expect(@user1).to eq(nil)
    end

    it "should accept valid password with a vaild email" do
      @user = User.create!(id: 1, first_name: 'Dude', last_name: 'Dudes', email: "dude@g.com", password: 'baluTheBear', password_confirmation: "baluTheBear")
      @email = "dude@g.com"
      @pass = 'baluTheBear'
      @user1 = User.authenticate_with_credentials(@email, @pass)
      expect(@user[:id]).to eq(@user1[:id])
    end  
  end
  
end
