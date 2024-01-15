class ApplicationController < ActionController::Base
  # devise利用の機能が使われる前にconfigure_permitted_parametersメソッドが実行される
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後にabout画面に遷移する
  def after_sign_in_path_for(resource)
    about_path
  end

  protected
  # configure_permitted_parametersメソッドでは、devise_parameter_sanitizer.permitメソッド
  # を使うことでユーザー登録の際に、nameのデータ操作を許可する
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
