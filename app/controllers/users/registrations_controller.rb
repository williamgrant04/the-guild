# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @member = Member.new
    @user = User.new
    p "IJOGRDFGRKL; DLGCDR;L;GHLKHCDT;,LFTHD;,FTH;,I"
  end

  # POST /resource
  def create
    p "\n"
    p "\n"
    p member_params
    @member = Member.new(member_params.except(:profile))
    @user = User.new(user_params.except(:member))
    p @member
    p @user
    # p "IJOGRDFGRKL; DLGCDR;L;GHLKHCDT;,LFTHD;,FTH;,I"
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, member: [:username, :profile_image])
  end

  def member_params
    user_params.require(:member).permit(:username, :profile_image)
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
