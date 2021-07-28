class RelationshipsController < ApplicationController
before_action :authenticate_user!,except: [:top]

   def create
    if
     current_user.id == User.find(params[:user_id])
    else
     current_user.follow(params[:user_id])
     redirect_to request.referer
    end
   end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

end
