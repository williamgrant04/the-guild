# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  layout "devise_forms"
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    if cookies["_the_guild_session"].present?
      # redirect_to root_path
    end
    @member = Member.new
    @user = User.new
    @member.user = @user
  end

  # POST /resource
  def create
    @user = User.new({ **user_params, member_details: member_details })
    if @user.save
      sign_in(@user)
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    super
  end

  protected

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def member_details
    params.require(:user).require(:member).permit(:username, :profile_image).to_h
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:member])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
