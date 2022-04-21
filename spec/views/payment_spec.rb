require 'rails_helper'

RSpec.describe 'Payment', type: :feature do
  before :each do
    @user = User.new(name: 'Tom', email: 'georg@gmail.com', password: 'asdasd')
    @user.save
    @category = Category.new(name: 'my category', icon: 'icon')
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    click_link 'New category'
    fill_in 'Name', with: @category.name
    fill_in 'Icon URL', with: @category.icon
    click_button 'Add Category'
  end

  it 'should be able to see payments' do
    click_on 'my category'
    expect(page).to have_content('Category')
  end

  it 'should be able to redirect to add new payment' do
    click_on 'my category'
    click_link 'New payment'
    expect(page).to have_current_path(new_payment_path)
  end

  it 'should be able to save payment' do
    click_on 'my category'
    click_link 'New payment'
    # page.save_and_open_page
    fill_in 'Name', with: 'My Payment'
    fill_in 'Amount', with: 5
    first('#payment_category_ids option', minimum: 1).select_option
    click_button 'Add Payment'
    click_on 'my category'
    expect(page).to have_content('My Payment')
  end
end
