# frozen_string_literal: true

module Api
  module V1
    class PostsController < Api::BaseController
      def index
        respond_with_output(success: true, result: Post.all.order(created_at: :desc))
      end

      def show
        respond_with_output(success: true, result: Post.find(params[:id]))
      end

      def create
        post = @user.posts.new(post_params)
        if post.save
          render json: { result: post }, status: 200
        else
          render json: { error: { message: post.errors } }, status: :unprocessable_entity
        end
      end

      def destroy
        post = @user.posts.find_by_id(params[:id])
        if post
          post.destroy
        else
          render json: { post: 'not found' }, status: :not_found
        end
      end

      private

      def post_params
        params.require(:post).permit(:title, :body, :category_id, :user_id)
      end
    end
  end
end
