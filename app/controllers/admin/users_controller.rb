class Admin::UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_required
  layout 'admin/application'


  def index
    @users = User.all
  end

  def to_admin
    @user = User.find(params[:id])
    @user.to_admin

    redirect_to admin_users_path
  end

  def to_normal
    @user = User.find(params[:id])
    @user.to_normal

    redirect_to admin_users_path
  end
  private
  def admin_required
    if !current_user.admin?
      redirect_to "/"
    end
  end
end
