class UsersController < ApplicationController
  def show
      if company_signed_in?
      @user=User.find(params[:id])
      rooms = current_company.rooms
      #自分が入ってるroomの相手のidを格納する
      @user_ids = []
      rooms.each do |r|
        @user_ids << r.user_id
      end


    else
      @user=User.find(params[:id])

    end
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
