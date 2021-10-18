class FriendshipsController < ApplicationController
  def index
    @incoming = current_user.incoming_friend_requests
    @outgoing = current_user.friend_requests
  end

  def friend_requests
    # @user = User.joins(:friend_requests, :incoming_friend_requests).find(params[:id])
    # @users = User.where.not(id: current_user)
    user = User.find(params[:user_id])
    if user.present?
      @friend_ship = Friendship.new(requester_id: current_user.id, addressee_id: user.id)
      respond_to do |format|
        if @friend_ship.save
          format.js{}
          format.html { redirect_to show_friends_users_path, notice: "Successfully able to friend request." }
          format.json { render :show, status: :created, location: @friend_ship }
        else
          format.html { redirect_to show_friends_users_path, status: :unprocessable_entity }
          format.json { render json: @friend_ship.errors, status: :unprocessable_entity }
        end
      end
    end

  end

  def friend_show

  end

  def incoming_friend_requests
    @friend_ship = Friendship.where(requester_id: current_user.id)
    # @users = User.where.not(id: current_user)
    # @user = User.joins(:friend_requests, :incoming_friend_r/equests).find(params[:user][:id])
  end
end
