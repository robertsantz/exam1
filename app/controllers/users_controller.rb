class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if verify_recaptcha
      if @user.save
        UserMailer.registration_confirmation(@user).deliver
        redirect_to new_user_path, :notice => "Signed Up!!"
      else
        render :new
      end
    else
      flash.now[:error] = "There was an error with recaptcha code below. Please re enter the code and submit click submit."
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to 'edit', :notice => "User successfully updated"
    else
      flash[:notice] = "User was failed to update"
      render 'edit'
    end
  end
  
end
