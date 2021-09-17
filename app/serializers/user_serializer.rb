# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :all_posts

  def all_posts
    object.posts.order(created_at: :desc)
  end
end
