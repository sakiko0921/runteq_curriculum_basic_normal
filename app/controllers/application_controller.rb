class ApplicationController < ActionController::Base
    before_action :require_login

  private
    def require_login
      unless logged_in?
        flash[:error] = "このセクションにアクセスするにはログインが必要です"
        redirect_to new_login_url # リクエストサイクルを停止する
      end
    end

    def not_authenticated
        redirect_to login_path
    end

end
