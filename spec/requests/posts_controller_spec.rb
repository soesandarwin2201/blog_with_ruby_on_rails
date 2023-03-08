require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET #index' do
    it 'returns a successful response' do
      get '/user/2/posts'
      expect(response).to be_successful
    end

    it 'assigns all users to @users' do
      get '/user/2/posts'
      expect(assigns(:posts)).to eq(Post.all)
    end

    it 'check the template' do
      get '/user/2/posts'
      expect(response).to render_template('index')
    end

    it 'check for the content' do
      get '/user/2/posts'
      expect(response.body).to include('<p>Here is the list for all post of bloger.</p>')
    end

    it 'check for the right id' do
      get '/user/2/posts/1'
      expect(response).to be_successful
    end

    it 'check for the right template for the given id' do
      get '/user/2/posts/1'
      expect(response).to render_template('show')
    end

    it 'check for the right body for the given id' do
      get '/user/2/posts/1'
      expect(response.body).to include('<h1>list of posts for the given person!</h1>')
    end
  end
end
