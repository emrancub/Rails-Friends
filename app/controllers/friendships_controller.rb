class FriendshipsController < ApplicationController
  #
  # def create
  #   id1 = params[:ids][:id1]
  #   id2 = params[:ids][:id2]
  #   @friend_ship = Friendship.new(requester_id: id1, addressee_id: id2)
  #   @friend_ship.save
  #   redirect_to show_friends_users_path
  # end

  # def destroy
  #   friendship = Friendship.find(params[:friend_id])
  #   friendship.destroy
  #   redirect_to show_friends_users_path(current_user.id)
  # end
  #
  # def update
  #   friendship = Invitation.find(params[:invitation_id])
  #   p current_user
  #   friendship.update(confirmed: true)
  #   redirect_to show_friends_users_path(friendship.friend_id)
  # end

  # def index
  #   @incoming = current_user.incoming_friend_requests
  #   @outgoing = current_user.friend_requests
  # end

  def friend_requests
    # @user = User.joins(:friend_requests, :incoming_friend_requests).find(params[:id])
    # @users = User.where.not(id: current_user)
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
  #
  # def incoming_friend_requests
  #   @friend_ship = Friendship.where(requester_id: current_user.id)
  #   # @users = User.where.not(id: current_user)
  #   # @user = User.joins(:friend_requests, :incoming_friend_r/equests).find(params[:user][:id])
  # end
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
