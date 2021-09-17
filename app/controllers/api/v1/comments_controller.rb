# frozen_string_literal: true

module Api
  module V1
    class CommentsController < Api::BaseController
      def index
        respond_with_output(success: true, result: Comment.all.order(created_at: :desc))
      end

      def create
        comment = post.comments.new(comment_params)
        if comment.save
          render json: { result: comment }, status: 200
        else
          render json: { error: { message: comment.errors } }, status: :unprocessable_entity
        end
      end

      def destroy
        comment = post.comments.find_by_id(params[:id])
        if comment
          comment.destroy
        else
          render json: { comment: 'not found' }, status: :not_found
        end
      end

      private

      def post
        @post = @user.posts.find_by_id(params[:post_id])
      end

      def comment_params
        params.require(:comment).permit(:username, :content, :avatar, :post_id, :category_id, :user_id)
      end
    end
  end
end
