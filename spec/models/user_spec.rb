require 'rails_helper'
RSpec.describe User, type: :model do

  before(:each) do
    @user = create(:user)
  end

  it 'is invalid if is empty' do
    expect(User.new).to_not be_valid
  end

  it 'is saved with valid data' do
    expect(@user).to be_persisted
  end

  it 'fails to create a new user with a taken email' do
    new_user = build(:user, username: 'John')
    new_user.save
    expect(new_user.save).to_not be_truthy
    expect(new_user.errors.messages[:email]).to include('has already been taken')
  end

  it 'fails to create a new user with a taken username' do
    new_user = build(:user, email: 'john@test.com')
    new_user.save
    expect(new_user.save).to_not be_truthy
    expect(new_user.errors.messages[:username]).to include('has already been taken')
  end


end