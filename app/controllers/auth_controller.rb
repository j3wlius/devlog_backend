class AuthController < ApplicationController
  def register
    user = User.new(user_params)

    if user.save
      token = encode_token({ user_id: user.id })
      render json: { token: token, username: user.username }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      token = encode_token({ user_id: user.id })
      render json: { token: token, username: user.username }, status: :ok
    else
      render json: { errors: "Invalid email or password" }, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:email, :password, :username)
  end
end
