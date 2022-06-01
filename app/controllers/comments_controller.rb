class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]

  def new
    @comment = Comment.new(user: current_user, product_id: params[:product_id])
  end

  def show; end

  def create
    @comment = Comment.new(user: current_user, product_id: params[:product_id])
    @comment.update(comment_params)
    if @comment.save
      flash[:success] = 'Comment created!'
      redirect_to @comment.product
    else
      @comments = Comment.order created_at: :desc
      redirect_to @comment.product
    end
  end

  def destroy
    @comment.destroy
    redirect_to @comment.product
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :rating)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
