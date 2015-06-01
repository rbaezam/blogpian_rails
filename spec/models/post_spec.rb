require 'rails_helper'

RSpec.describe Post, type: :model do
  
  context 'before create callback' do
    it 'should set the current date to created_at property' do
      post = Post.new
      post.save
      expect(post.created_at).to_not be_nil
    end
  end

end
