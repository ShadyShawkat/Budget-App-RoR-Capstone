require 'rails_helper'

RSpec.describe Payment, type: :model do
  before :each do
    @user = User.new(name: 'Tom', email: 'tom@gmail.com', password: 'asdasd')
    @payment = Payment.new(name: 'Payment', amount: 1, user: @user)
  end

  it 'name should be valid with correct parameters' do
    expect(@payment).to be_valid
  end

  it 'name should be present' do
    @payment.name = nil
    expect(@payment).to_not be_valid
  end

  it 'amount should be present' do
    @payment.amount = nil
    expect(@payment).to_not be_valid
  end
end