class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.save
      flash[:notice] = "Save was successfull! Welcome to Bloccit, #{@user.name}."
      create_session(@user)
      redirect_to root_path
    else
      flash.now[:alert] = "Whoa, that didn't work. Please try again."
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.visible_to(current_user)
  end
end
