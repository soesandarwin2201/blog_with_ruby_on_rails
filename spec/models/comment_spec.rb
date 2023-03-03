require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Check for the validations for the comment' do
    let(:comment) { Comment.new(text: 'test for comment', author_id: 2) }

    before { comment.save }

    it 'title should be present' do
      comment.text = nil
      expect(comment).to_not be_valid
    end

    it 'author id should be integer' do
      comment.author_id = 'd'
      expect(comment).to_not be_valid
    end
  end
end
