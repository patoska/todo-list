class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    render json: User.all
  end

  def show
    render json: @user
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: { errors: @user.errors, status: :unprocessable_entity }
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: { errors: @user.errors, status: :unprocessable_entity}
    end
  end

  def destroy
    @user.destroy!
    render json: { status: :ok }
  end

  private
  
  def set_user
    @user = User.find(params.expect(:id))
  end

  
  def user_params
    params.expect(user: [ :first_name, :last_name, :position, :avatar ])
  end
end
