class FriendshipsController < ApplicationController
  def friend_requests
    user = User.find(params[:user_id])
    if user.present?
      @friend_ship = Friendship.new(requester_id: current_user.id, addressee_id: user.id)
      @friend_ship.status = "requested"
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

  def accept_friend_request
    @friend_ship = Friendship.where(requester_id: params[:id], addressee_id: current_user).first
    @friend_ship.status = "accepted"

    respond_to do |format|
      if @friend_ship.save
        format.html { redirect_to show_friends_users_path, notice: "Successfully accepted friend request." }
      else
        format.html { redirect_to show_friends_users_path, status: :unprocessable_entity }
      end
    end
  end

end
