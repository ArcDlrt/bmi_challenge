require 'rails_helper'
RSpec.describe User, type: :model do
  it 'is invalid if is empty' do
    expect(User.new).to_not be_valid
  end

  it 'is saved with valid data' do
    @user = create(:user)
    expect(@user).to be_persisted
  end
end