class UsersController < ApplicationController
  def show
    # binding.pry
    if session[:user_id].to_s == params[:id]
      @user = User.find(params[:id])
    else
      render '404'
    end
  end

  def new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session['user_id'] = @user.id
      redirect_to :root
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(params[:user])
    if @user.save
      render 'index'
    else
      render '404'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user
      @user.destroy
    else
      render '404'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end