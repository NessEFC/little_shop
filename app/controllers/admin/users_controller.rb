class Admin::UsersController < Admin::BaseController

  def show
  end

  def edit
    @user = current_user
  end

  def dashboard
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(admin_params)
      flash[:success] = "You successfully updated your account"
      redirect_to admin_dashboard_path
    else
      render :edit
    end
  end

  private
  def admin_params
    params.require(:user).permit(:username)
  end
end

