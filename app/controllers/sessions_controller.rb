class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
      flash[:success] = "ログインしました。"
    else
      flash.now[:danger] = 'メールとパスワードの組み合わせが間違っています！'
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:success] = "ログアウトしました。"
    redirect_to root_url
  end
end