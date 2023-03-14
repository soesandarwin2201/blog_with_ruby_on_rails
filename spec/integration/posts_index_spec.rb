require 'rails_helper'

RSpec.describe 'Posts index page', type: :system do
  describe 'check the content of the index page' do
    before(:each) do
      @user_one = User.create(name: 'soe sandar win',
                              photo: 'https://www.anisearch.de/images/character/cover/full/0/817.webp', bio: 'software engineer', postscounter: 0)
      @post_one = Post.create(author: @user_one, title: 'Hello', text: 'this is my first post', commentscounter: 0,
                              likescounter: 0)
      @post_two = Post.create(author: @user_one, title: 'jobs', text: 'I am gonna get a jon in may', commentscounter: 0,
                              likescounter: 0)
      @comment = Comment.create(post: @post_two, author: @user_one, text: 'hi nice to meet you')
    end

    it 'User should see the other user profile picture' do
      visit user_posts_path(@user_one)
      expect(page).to have_selector('img')
    end

    it 'User should see the other user name' do
      visit user_posts_path(@user_one)
      expect(page).to have_content('soe sandar win')
    end

    it 'User should see the post title' do
      visit user_posts_path(@user_one)
      expect(page).to have_content('Hello')
      expect(page).to have_content('jobs')
    end

    it 'User should see the first comment' do
      visit user_posts_path(@user_one)
      expect(page).to have_content('hi nice to meet you')
    end

    it 'User should see the comment counter and like counter' do
      visit user_posts_path(@user_one)
      expect(page).to have_content('Comments:')
      expect(page).to have_content('Likes:')
    end

    it 'User should see the pagination button ' do
      visit user_posts_path(@user_one)
      expect(page).to have_content('Pagination')
    end

    it 'User should see the show page ' do
      visit user_posts_path(@user_one)
      click_link 'Hello'
      expect(page).to have_content('this is my first post')
    end
  end
end
