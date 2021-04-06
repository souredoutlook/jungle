require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:all) do
    #create valid_user to test authenticatie_with_credentials and uniqueness validations against
    @valid_user = User.create!(first_name: "First", last_name: "Last", email: "test@test.com", password: "password", password_confirmation: "password")
  end
  
  describe 'Validations' do
    
    # validates :first_name, presence: true
    it "fail if first name is blank" do
      invalid_user = User.create(first_name: "", last_name: "Last", email: "what@amess.com", password: "password", password_confirmation: "password")

      # puts invalid_user.errors.full_messages.first.inspect

      expect(invalid_user.errors.full_messages.first).to eql("First name can't be blank")
    end
    
    # validates :last_name, presence: true
    it "fail if last name is blank" do
      invalid_user = User.create(first_name: "First", last_name: "", email: "what@amess.com", password: "password", password_confirmation: "password")

      # puts invalid_user.errors.full_messages.first.inspect

      expect(invalid_user.errors.full_messages.first).to eql("Last name can't be blank")
    end
    # validates :email, presence: true
    it "fail if email is blank" do
      invalid_user = User.create(first_name: "First", last_name: "Last", email: "", password: "password", password_confirmation: "password")

      # puts invalid_user.errors.full_messages.first.inspect

      expect(invalid_user.errors.full_messages.first).to eql("Email can't be blank")
    end
    # validates :email, uniqueness: true
    it "fail if email is not unique" do
      invalid_user = User.create(first_name: "First", last_name: "Last", email: "test@test.com", password: "password", password_confirmation: "password")

      # puts invalid_user.errors.full_messages.first.inspect

      expect(invalid_user.errors.full_messages.first).to eql("Email has already been taken")
    end

    # validates :email, uniqueness: true
    it "fail if email is not unique - case insenitively" do
      invalid_user = User.create(first_name: "First", last_name: "Last", email: "TEST@TEST.COM", password: "password", password_confirmation: "password")

      # puts invalid_user.errors.full_messages.first.inspect

      expect(invalid_user.errors.full_messages.first).to eql("Email has already been taken")
    end
    
    # validates :password_confirmation, presence: true
    it "fail if password is not confirmed" do
      invalid_user = User.create(first_name: "First", last_name: "Last", email: "what@amess.com", password: "password", password_confirmation: "")
      
      # puts invalid_user.errors.full_messages.inspect
      
      expect(invalid_user.errors.full_messages.length).to eq(3)
      expect(invalid_user.errors.full_messages.first).to eql("Password confirmation doesn't match Password")
      expect(invalid_user.errors.full_messages.second).to eql("Password confirmation can't be blank")
      expect(invalid_user.errors.full_messages.third).to eql("Password confirmation doesn't match Password")
    end

       # validates :password, length: {minimum: 8}
       it "fail if password is shorter than 8 characters" do
        invalid_user = User.create(first_name: "First", last_name: "Last", email: "what@amess.com", password: "passwd", password_confirmation: "passwd")
        
        # puts invalid_user.errors.full_messages.inspect
        
        expect(invalid_user.errors.full_messages.first).to eql("Password is too short (minimum is 8 characters)")
      end
    
    # validates :password, confirmation: true
    it "succeed if all fields present and correct" do
      test_user = User.create!(first_name: "First", last_name: "Last", email: "what@amess.com", password: "password", password_confirmation: "password")

      expect(test_user.id).not_to be_nil
    end

  end
  
  
  describe ".authenticate_with_credentials" do
    it "returns nil if email is incorrect" do
      user = User.authenticate_with_credentials("notanemail@fake.com", "passwordd")
      expect(user).to be_nil
    end

    it "returns nil if password is incorrect" do
      user = User.authenticate_with_credentials("test@test.com", "passwd")
      expect(user).to be_nil
    end
    
    it "succeeds if all fields are present and correct" do
      user = User.authenticate_with_credentials("test@test.com", "password")
      expect(user).not_to be_nil
    end

    it "succeeds if password is correct and email is cased improperly" do
      user = User.authenticate_with_credentials("TEST@TEST.COM", "password")
      expect(user).not_to be_nil
    end

    it "succeeds if password is correct and email includes extra leading and trailing whitespce" do
      user = User.authenticate_with_credentials("  TEST@TEST.COM  ", "password")
      expect(user).not_to be_nil
    end
  end
  
  after(:all) do
    @valid_user.destroy
  
  end
end
