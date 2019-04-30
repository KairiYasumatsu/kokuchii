class UsersController < ApplicationController
  def show
      @user=User.find(params[:id])
  end

  def destroy
       @user=User.find(params[:id]).destroy
       redirect_to tops: :index
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      flash[:success]="プロフィールを編集しました"
      redirect_to :action => "show", :id => @user.id
    else
      render :edit
    end
  end

  def likes
    @user = User.find_by(id:params[:id])
    @likes = Like.where(user_id: @user_id)
  end

  private
  def user_params
    params.require(:user).permit(:profile)
  end

end
