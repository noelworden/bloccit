class FavoritesController < ApplicationController

  before_action :require_sign_in

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)

    if favorite.save
      flash[:notice] = "Post favorited, hombre"
    else
      flash[:alert] = "Favoriting failed, amigo"
    end

    redirect_to [post.topic, post]
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])

    if favorite.destroy
      flash[:notice] = "Unfavorited, hombre"
    else
      flash[:alert] = "Unfavoriting failed, amigo"
    end

    redirect_to [post.topic, post]
  end
end