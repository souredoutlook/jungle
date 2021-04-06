require 'rails_helper'

RSpec.describe User, type: :model do
 
  describe 'Validations' do
    before(:all) do
      #create valid_user1 to test uniqueness validations against
      @valid_user = User.create!(first_name: "First", last_name: "Last", email: "test@test.com", password: "password", password_confirmation: "password")
    end
    
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
    
    # validates :password, confirmation: true
    it "succeed if all fields present and correct" do
      test_user = User.create!(first_name: "First", last_name: "Last", email: "what@amess.com", password: "password", password_confirmation: "password")

      expect(test_user.id).not_to be_nil
    end

    after(:all) do
      @valid_user.destroy
    end
  end


end
