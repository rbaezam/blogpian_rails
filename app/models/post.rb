class Post
  include Mongoid::Document

  field :title, type: String
  field :body, type: String
  field :created_at, type: DateTime
  field :tags, type: Array
  field :user, type: String
  field :is_published, type: Boolean
end