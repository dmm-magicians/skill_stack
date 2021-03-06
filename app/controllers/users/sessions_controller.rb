# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  rescue_from ActionController::InvalidAuthenticityToken do
    redirect_to request.referrer, alert: "リクエスト期限切れです。再トライしてみて下さい。"
  end
  before_action :configure_sign_in_params, only: [:create]

  def user_simple_login
  	user = User.guest
    sign_in user
    redirect_to root_path, notice: "ゲストユーザーとしてログインしました。"
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end


  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end
end
