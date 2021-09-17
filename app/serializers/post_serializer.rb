# frozen_string_literal: true

class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :post_body, :category_name, :comments_count, :publication_date

  def category_name
    object.category.name
  end

  def post_body
    body = object.body
    if body.length >= 500
      body[0, 500].concat('...')
    else
      body
    end
  end

  def publication_date
    object.created_at.strftime('%F %H:%M')
  end

  def comments_count
    object.comments.count
  end
end
