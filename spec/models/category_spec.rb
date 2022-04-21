require 'rails_helper'

RSpec.describe Category, type: :model do
  before :each do
    @user = User.new(name: 'Tom', email: 'tom@gmail.com', password: 'asdasd')
    @category = Category.new(name: 'Category', icon: 'icon', user: @user)
  end

  it 'name should be valid with correct params' do
    expect(@category).to be_valid
  end

  it 'name should be present' do
    @category.name = nil
    expect(@category).to_not be_valid
  end

  it 'icon should be present' do
    @category.icon = nil
    expect(@category).to_not be_valid
  end
end
