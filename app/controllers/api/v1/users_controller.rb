class Api::V1::UsersController <Api::V1::BaseController

  before_action :authenticate_user
  before_action :authorize_user

  def show
    user = User.find(params[:id])
    render json: user, status: 200
  end

  def index
    users = User.all
    render json: users, status: 200
  end

  def update
    user = User.find(params[:id])

    if user.update_attributes(user_params)
      render json: user, status: 200
    else
      render json: {error: "User update failed", status: 400}, status: 400
    end
  end

  def create
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
  end
end