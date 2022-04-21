require 'rails_helper'

RSpec.describe 'Category', type: :feature do
  before :each do
    @user = User.new(name: 'Tom', email: 'tom@gmail.com', password: 'asdasd')
    @user.save
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on 'Log in'
  end

  it 'should be able to see categories' do
    expect(page).to have_content('Categories')
  end

  it 'should be able to redirect to add new category' do
    click_link 'New category'
    expect(page).to have_current_path(new_category_path)
  end

  it 'should be able to save category' do
    click_link 'New category'
    fill_in 'Name', with: 'My Category'
    fill_in 'Icon URL', with: 'icon'
    click_button 'Add Category'
    expect(page).to have_content('My Category')
  end
end
