require 'rails_helper'

RSpec.describe 'Users index page', type: :system do 
  describe 'check the content of the index page' do 
   before(:each) do
    @user_one = User.create(name: 'soe sandar win', photo: 'https://www.anisearch.de/images/character/cover/full/0/817.webp', bio: 'software engineer', postscounter: 0)
    @user_two = User.create(name: 'peter', photo: 'https://www.anisearch.de/images/character/cover/full/0/817.webp', bio: 'software engineer', postscounter: 0)
    @user_three = User.create(name: 'Nizamuddin', photo: 'https://www.anisearch.de/images/character/cover/full/0/817.webp', bio: 'software engineer')
   end

   it 'show the right content' do
    visit root_path
    expect(page).to have_content('These are current Users.')
   end

   it 'profile picture for each user.' do
    visit root_path
    expect(page).to have_selector('img')
   end

   it 'the number of posts each user has written' do
    visit root_path
    expect(page).to have_content('Number of posts:')
   end

   it 'When I click on a user, I am redirected to that user show page' do
    visit root_path
    click_link 'soe sandar win'
    expect(page).to have_content('software engineer')
   end

  
  end
 end  