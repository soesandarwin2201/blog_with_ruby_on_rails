require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users/:id' do
    it 'returns a success response' do
      user = User.create(id: 1, name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
      puts user.inspect
get user_path(user.id)
      get user_path(user.id)
  expect(response).to be_successful
    end
  end
end
