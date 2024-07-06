class UsersController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_user, only: [:destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    if params[:user][:campaigns_list].is_a?(String)
      params[:user][:campaigns_list] = JSON.parse(params[:user][:campaigns_list])
    end

    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: 'User was successfully created.'
    else
      @users = User.all
      render :new
    end
  end

  def filter_by_campaigns
    campaign_names = params[:campaign_names].split(',')
    query = campaign_names.map { |name| "JSON_SEARCH(campaigns_list, 'all', '#{name}', NULL, '$[*].campaign_name') IS NOT NULL" }.join(' OR ')
    @users = User.where(query)
    render :index
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: 'User was successfully deleted.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, campaigns_list: [:campaign_name, :campaign_id])
  end
end
