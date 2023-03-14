require 'rails_helper'

RSpec.describe 'Posts show page', type: :system do 
  describe 'check the content of the show page' do 
   before(:each) do
    @user_one = User.create(name: 'soe sandar win', photo: 'https://www.anisearch.de/images/character/cover/full/0/817.webp', bio: 'software engineer', postscounter: 0)
    @post_one = Post.create(author: @user_one, title: 'Hello', text: 'this is my first post', commentscounter: 0, likescounter: 0)
    @post_two = Post.create(author: @user_one, title: 'jobs', text: 'I am gonna get a jon in may', commentscounter: 0, likescounter: 0)
    @comment = Comment.create(post: @post_one, author: @user_one, text: 'hi nice to meet you')
   end
   
   it 'User should see the post title' do 
    visit user_post_path(@user_one,@post_one)
    sleep(1)
    expect(page).to have_content('Hello')
   end

   it 'User should see wrote the post' do 
    visit user_post_path(@user_one,@post_one)
    sleep(1)
    expect(page).to have_content('soe sandar win')
   end

   it 'User should see  the post body ' do 
    visit user_post_path(@user_one,@post_one)
    sleep(1)
    expect(page).to have_content('this is my first post')
   end

   it 'User should see comments it has' do 
    visit user_post_path(@user_one,@post_one)
    sleep(1)
    expect(page).to have_content('hi nice to meet you')
   end

   it 'User should see user name who comment ' do 
    visit user_post_path(@user_one,@post_one)
    sleep(1)
    expect(page).to have_content('soe sandar win')
   end
  end
 end