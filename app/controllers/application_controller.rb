class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  #privateは自分のコントローラ内でしか参照できないから、
  #呼び出された今回のコントローラではprotectedで参照する
  protected

  def configure_permitted_parameters
    #nameのデータ操作を許可するアクションメソッドが指定されている
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
