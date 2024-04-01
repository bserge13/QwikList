class UsersController < ApplicationController
  def new;end 

  def show 
    @user = User.find(params[:id])
    @lists = @user.lists.desc_order
  end

  def create
    new_user = User.create(user_params)

    if new_user.valid? 
      redirect_to user_path(new_user)
    else 
      flash[:alert] = 'Looks like that email is already in use. Wanna try again?'
      redirect_to '/register'
    end
  end 

  def login_form;end

  def login_user
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = 'Welcome back to QwikList!'
      redirect_to user_path(user)
    else 
      flash[:alert] = "Uh oh, your login info doesn't seem to match our records. Wanna try again?"
      redirect_to login_path
    end
  end

  def log_out

  end

  private 

  def user_params
    params.permit(:name, :email, :password)
  end
end