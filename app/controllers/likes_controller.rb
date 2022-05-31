class LikesController < ApplicationController

  def index
    @user = current_user
    @likes = @user.likes
    @pagy, @records = pagy(@likes, items: 10)
  end

  def show_likes
    @likes = Like.where(user: current_user)
    @pagy, @records = pagy(@likes, items: 10)
  end

  def create
    if liked?
        @like = Like.find_by(user: current_user, product_id: params[:product_id])
        @like.destroy
        redirect_to root_path
    else
        @like = Like.new(user: current_user, product_id: params[:product_id])
        if @like.save
          flash[:success] = 'Comment created!'
          redirect_to @like.product
        else
          @likes = Like.order created_at: :desc
          redirect_to root_path
        end 
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to @like.product
  end

  private

  def destroy1
        @like = Like.where(product_id: params[:product_id])
        @like.destroy
        redirect_to @like.product
  end

  def liked?
    Like.where(user: current_user, product_id: params[:product_id]).exists?
  end
  
end