class UsersController < ApplicationController
  def new;end 

  def show 
    # if current_user
      @user = User.find(params[:id])
      @lists = @user.lists.desc_order
    # else 
      # redirect_to root_path
      # flash[:error] = 'You must be logged in or registered to access your dashboard'
    # end
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
      redirect_to user_path(user)
    else 
      flash[:alert] = "Uh oh, your login info doesn't seem to match our records. Wanna try again?"
      redirect_to login_path
    end
  end

  def log_out
    session.clear
    redirect_to root_path
  end

  def edit 
    @user = User.find(params[:id])
  end

  def update 
    user = User.find(params[:id])
    
    if params[:commit] == 'sign up'
      twilio_num_format = '+1' + params[:phone_num].delete('-')
      user.update_columns(notifications_on: true, phone_num: twilio_num_format)
    elsif params[:commit] == 'cancel notifications'
      user.update_columns(notifications_on: false, phone_num: nil)
    end 

    redirect_to edit_user_path(user)
  end

  private 

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end