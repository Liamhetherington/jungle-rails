require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with valid fields' do 
      user = User.new(first_name: "Liam", last_name: "Hetherington", password: "something", password_confirmation: "something", email: "LIAM@LIAM")
    end
    it 'is not valid without a password and matching confirmation' do 
      user = User.new(first_name: "Liam", last_name: "Hetherington", password: "something", password_confirmation: "somethingelse", email: "LIAM@LIAM")
      expect(user).to_not be_valid
    end
    it 'is unique and not in the database' do
      user = User.create(first_name: "Liam", last_name: "Hetherington", password: "something", password_confirmation: "something", email: "LIAM@LIAM")
      user = User.create(first_name: "Liam", last_name: "Hetherington", password: "something", password_confirmation: "something", email: "LIAM@LIAM")
      expect(user).to_not be_valid
    end
    it 'is not case sensitive' do
      user = User.create(first_name: "Liam", last_name: "Hetherington", password: "something", password_confirmation: "something", email: "harriet@harriet")
      user = User.create(first_name: "Liam", last_name: "Hetherington", password: "something", password_confirmation: "something", email: "HARRIET@HARRIET")
      expect(user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    let!(:user) {User.create(first_name: "Liam", last_name: "Hetherington", password: "something", password_confirmation: "something", email: "LIAM@LIAM")}
    it 'creates a user with valid authentication credentials' do
      current_user = User.authenticate_with_credentials("  LIAM@LIAM", "something")
      expect(current_user).to eql(user)
    end
  end
end
