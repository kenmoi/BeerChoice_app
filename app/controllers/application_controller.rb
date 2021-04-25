class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: %i[top show mypage]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    flash[:notice] = 'ログインに成功しました！'
    root_path
  end

  def after_sign_out_path_for(_resourse)
    flash[:notice] = 'ログアウトしました！'
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[name birth_date sex prefecture_id password password_confirmation])
  end
end
