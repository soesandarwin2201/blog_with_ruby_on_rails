require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Validation for the like model' do
    let(:like) { Like.new(author_id: 1, post_id: 2) }

    before { like.save }

    it 'check the id ' do
      like.author_id = 0
      expect(like).to_not be_valid
    end

    it 'check the post id ' do
      like.post_id = nil
      expect(like).to_not be_valid
    end
  end
end
