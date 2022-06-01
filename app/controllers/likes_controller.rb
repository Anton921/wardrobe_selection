class LikesController < ApplicationController

  def show_likes
    @likes = Like.where(user: current_user).order(created_at: :desc)
    @pagy, @records = pagy(@likes, items: 10)
  end

  def create
    if liked?
        @like = Like.find_by(user: current_user, product_id: params[:product_id])
        @like.destroy
        redirect_to @like.product
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

  private

  def liked?
    Like.where(user: current_user, product_id: params[:product_id]).exists?
  end
  
end