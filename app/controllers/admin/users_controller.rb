class Admin::UsersController < Admin::BaseController
  def index
    @q = User.ransack(params[:q])
    @users = @q.result.page(params[:page])
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user), success: t('defaults.flash_message.updated', item: User.model_name.human)
    else
      flash.now['danger'] = t('defaults.flash_message.not_updated', item: User.model_name.human)
      render :edit
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy!
    redirect_to admin_users_path, success: t('defaults.flash_message.deleted', item: User.model_name.human), status: :see_other
  end

  private

  def user_params
    params.require(:user).permit(:email, :last_name, :first_name, :avatar, :avatar_cache, :role)
  end
end
