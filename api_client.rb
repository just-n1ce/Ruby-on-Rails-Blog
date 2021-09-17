# frozen_string_literal: true

require 'faraday'
require 'oj'

client = Faraday.new(url: 'http://localhost:3000') do |config|
  config.adapter Faraday.default_adapter
  # config.request :authorization, 'Bearer', '8a37f17b5c366a0509da4430e991ad60'
end

# response = client.post do |req|
#   req.url '/api/v1/users'
#   req.headers['Content-Type'] = 'application/json'
#   req.body = '{ "email": "test@test.com", "password": "123123" }'
# end

# response = client.post do |req|
#   req.url '/api/v1/posts'
#   req.headers['Content-Type'] = 'application/json'
#   req.body = '{ "title": "Title", "body": "Text", "category_id": "28", "user_id": "3" }'
# end

# response = client.post do |req|
#   req.url '/api/v1/posts/40/comments'
#   req.headers['Content-Type'] = 'application/json'
#   req.body = '{ "username": "Username", "content": "Text", "user_id": "3"}'
# end

# response = client.delete do |req|
#   req.url '/api/v1/posts/25'
#   req.headers['Content-Type'] = 'application/json'
# end

# response = client.delete do |req|
#   req.url '/api/v1/posts/40/comments/1'
#   req.headers['Content-Type'] = 'application/json'
# end

puts Oj.load(response.body)
puts response.status
