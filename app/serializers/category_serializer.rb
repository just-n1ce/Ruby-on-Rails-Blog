# frozen_string_literal: true

class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :all_posts

  def all_posts
    object.posts.order(created_at: :desc)
  end
end
