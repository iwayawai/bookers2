class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def index
    @users=User.all
    @book=Book.new
    @user=current_user
  end

  def show
    @users=User.all
    @user=User.find(params[:id])
    @books=@user.books
    @book=Book.new
  end

  def edit
    @user=User.find(params[:id])
    @book=Book.new
  end
  
  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
    flash[:notice]="You have updated user successfully."
    redirect_to books_path
    else
      render:edit
    end 
  end 
  
  private
  
  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end
  
   def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
      redirect_to books_path
    end
   end
end 
