require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before(:each) do
    Post.delete_all
    @post1 = Post.new(title: 'first post')
    @post1.save
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns JSON string with posts" do
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: @post1.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http found" do
      post :create, {post:{title:'new post', body:'body for the new post',tags_string:'technology'}}
      expect(response).to have_http_status(:found)
    end

    it "creates a new post" do
      post :create, {post:{title:'new post', body:'body for the new post',tags_string:'technology'}}
      newPost = Post.last
      expect(newPost.title).to eq('new post')
    end
  end
end
