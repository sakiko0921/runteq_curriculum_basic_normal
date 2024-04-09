class Admin::UsersController < Admin::BaseController
  def index
    @q = User.ransack(params[:q])
    @users = @q.result.page(params[:page])
  end

  def show
    @user = User.find_by(id: params[:id])
    unless @user
      redirect_to admin_users_path, alert: 'ユーザーが見つかりません'
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: 'ユーザーを更新しました'
    else
      flash.now['danger'] = t('defaults.flash_message.not_updated', item: User.model_name.human)
      render :edit
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy!
    redirect_to admin_users_path, notice: 'ユーザーを削除しました', status: :see_other
  end

  private

  def user_params
    params.require(:user).permit(:email, :last_name, :first_name, :avatar, :avatar_cache, :role)
  end
end
