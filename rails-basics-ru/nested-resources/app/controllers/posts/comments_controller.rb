module Posts
  class CommentsController < ApplicationController
    before_action :resource_post, only: %i[new create]

    def new
      @comment = @resource_post.comments.build
    end

    def create
      @comment = @resource_post.comments.build(comment_params)
      if @comment.save
        redirect_to post_url(@resource_post), notice: 'Comment is succesful create!'
      else
        render :new
      end
    end

    def edit
      @comment = PostComment.find(params[:id])
    end

    def update
      @comment = PostComment.find(params[:id])
      if @comment.update(comment_params)
        redirect_to post_url(@comment.post), notice: 'Post comment is sucessful edit'
      else
        render :edit
      end
    end

    def destroy
      @comment = PostComment.find(params[:id])
      if @comment.destroy
        redirect_to post_url(@comment.post), notice: 'Comment destory success!'
      else
        redirect_to post_url(@comment.post), notice: 'Something went wrong('
      end
    end

    private

    def comment_params
      params.require(:post_comment).permit(:body)
    end
  end
end
