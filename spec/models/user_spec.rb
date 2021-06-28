require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid if all 5 fields are filled out' do
      params = {
        name: 'Roger',
        last_name: 'Federer',
        email: 'roger@federer.com',
        password: 'asdf',
        password_confirmation: 'asdf',
      }
      expect(User.new(params)).to be_valid
    end

    it 'should not be valid if passwords do not match' do
      params = {
        name: 'Roger',
        last_name: 'Federer',
        email: 'roger@federer.com',
        password: 'asdf',
        password_confirmation: 'asdfff',
      }
      expect(User.new(params)).to_not be_valid
    end

    it 'should not be valid without an email' do
      params = {
        name: 'Roger',
        last_name: 'Federer',
        password: 'asdf',
        password_confirmation: 'asd',
      }
      expect(User.new(params)).to_not be_valid
    end

    it 'should not be valid without a last_name' do
      params = {
        name: 'Roger',
        email: 'roger@federer.com',
        password: 'asdf',
        password_confirmation: 'asd',
      }
      expect(User.new(params)).to_not be_valid
    end

    it 'should not be valid without a name' do
      params = {
        last_name: 'Federer',
        email: 'roger@federer.com',
        password: 'asdf',
        password_confirmation: 'asdf',
      }
      expect(User.new(params)).to_not be_valid
    end
    it 'should not be valid if password is less three chars' do
      params = {
        name: 'Roger',
        last_name: 'Federer',
        email: 'roger@federer.com',
        password: 'as',
        password_confirmation: 'as',
      }
      expect(User.new(params)).to_not be_valid
    end
  end
end
