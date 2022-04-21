require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(name: 'Tom', email: 'tom@gmail.com', password: 'asdasd')
  end

  it 'name should be valid with correct params' do
    expect(@user).to be_valid
  end

  it 'name shouldn\'t be nil' do
    @user.name = nil
    expect(@user).to_not be_valid
  end
end