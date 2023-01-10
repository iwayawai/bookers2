class UsersController < ApplicationController
  def index
  end

  def show
    @user=User.find(params[:id])
  end

  def edit
    @user=User.find(params[:id])
  end
  
  def update
    @user=User.find(params[:id])
    @user.update(user_params)
    redirect_to books_path
  end 
  
  private
  
  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end
end 
