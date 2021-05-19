class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :set_statuses

    # ログイン済ユーザーのみにアクセスを許可する
    before_action :authenticate_user!

    # deviseコントローラーにストロングパラメータを追加する
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    def configure_permitted_parameters
      # サインアップ時にnameのストロングパラメータを追加
      devise_parameter_sanitizer.permit(:sign_up, keys:        [:idnum, :name, :dep, :dep_name_id])
      # アカウント編集の時にnameとprofileのストロングパラメータを追加
      devise_parameter_sanitizer.permit(:account_update, keys: [:idnum, :name, :dep, :dep_name_id])
    end

    def set_statuses
      @DepNames= DepName.all
    end

end
