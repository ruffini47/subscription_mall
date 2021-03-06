class UsersController < ApplicationController
  before_action :set_user, only: [:create, :show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def deleted_users
    @users = User.with_deleted.where.not(deleted_at: nil)
  end

  def update_deleted_users
    @user = User.with_deleted.find(params[:id]).restore
    redirect_to users_url
  end

  def show
  end

  def user_account
    @user = User.find(params[:id])
  end

  def edit
  end

  def new
  end

  def thanks
    @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "#{@user.name}様の情報を更新しました。"
      redirect_to users_url
    else
      render :edit
    end
  end

  def destroy
    @user.soft_delete
    Devise.sign_out_all_scopes ? sign_out : sign_out(@user)
    yield @user if block_given?
    flash[:danger] = "#{@user.name}様のデータを削除しました"
    redirect_to users_url
  end

  def ticket


  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :kana, :email, :phone_number, :password, :password_confirmation)
    end
end
