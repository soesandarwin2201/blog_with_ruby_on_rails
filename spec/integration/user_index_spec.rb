require 'rails_helper'

RSpec.describe 'Users index page', type: :system do 
  describe 'check the content of the index page' do 
   it 'show the right content' do
    visit root_path
    expect(page).to have_content('There are no users')
   end

   it 'show the right content' do
    visit root_path
    expect(page).to have_content('These are current Users.')
   end
  end
 end  