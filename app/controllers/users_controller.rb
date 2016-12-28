class UsersController < ApplicationController

   skip_before_action :check_session, only: [:login, :login_authenticate, :new ,:create]
  def index

     @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
        redirect_to action: :index
    else
       render "new"
    end
  end

 def login
       @user = User.new
 end

def login_authenticate
  @user=User.authenticate(user_params)
  if @user
    session[:user_id]=@user.id
    redirect_to action: :index
  else
    redirect_to action: :login

  end
end
  def show
     @user=User.find params[:id]
  end

  def edit
    @user=User.find params[:id]
  end

  def update
    @user=User.find params[:id]
    if @user.update(user_params)
      redirect_to action: :index
      flash[:notice] = "successfully updated :)"
    else
      render :edit
      flash[:notice] = "something went worng"
    end
  end
def destroy
      @user=User.find params[:id]
      @user.delete
  redirect_to action: :index
      flash[:notice] = "successfully deleted :)"
end
  private
  def user_params
   params.require(:user).permit(:name, :email, :password, :confirm_password)
  end
end
