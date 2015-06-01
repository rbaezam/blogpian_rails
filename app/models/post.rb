class Post
  include Mongoid::Document

  attr_accessor :tags_string

  field :title, type: String
  field :body, type: String
  field :created_at, type: DateTime
  field :tags, type: Array
  field :user, type: String
  field :is_published, type: Boolean

  set_callback(:create, :before) do |doc|
    doc.created_at = Time.now
  end

end