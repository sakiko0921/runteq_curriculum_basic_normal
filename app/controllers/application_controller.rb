class ApplicationController < ActionController::Base
  before_action :require_login

  private

  #def require_login
  #  return if logged_in?

  #  flash[:error] = 'このセクションにアクセスするにはログインが必要です'
  #  redirect_to new_login_url
  #end

  def not_authenticated
    redirect_to login_path
  end
end
