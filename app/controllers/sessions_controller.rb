class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params['username'])
    if @user && @user.authenticate(params['password'])
      session['user_id'] = @user.id
      redirect_to :root
    else
      @errors = "Bad log in, try again."
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to :root
  end
end
