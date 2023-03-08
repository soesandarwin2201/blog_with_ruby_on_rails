require 'rails_helper'

RSpec.describe UserController, type: :request do
  describe "GET #index" do
    it "returns a successful response" do
      get "/user/"
      expect(response).to be_successful
    end

    it "assigns all users to @users" do 
      get "/user/"
      expect(assigns(:users)).to eq(User.all)
  end

    it "check the template" do 
      get "/user/"
      expect(response).to render_template('index')
  end

  it "check for the content" do 
    get "/user/"
    expect(response.body).to include('<p>Here is the list of user for the blog app</p>')
  end

  it 'check for the right id' do 
    get '/user/2'
    expect(response).to be_successful
  end

  it 'check for the right template for the given id' do 
    get '/user/2'
    expect(response).to render_template('show')
  end

  it 'check for the right body for the given id' do 
    get '/user/2'
    expect(response.body).to include('<h1>List of users for the given id</h1>')
  end
 
end
end
