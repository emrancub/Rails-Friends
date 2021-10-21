module FriendshipsHelper
  def is_requested?(requester_id, addressee_id)
    Friendship.where(requester_id: requester_id, addressee_id: addressee_id).first
  end

  def is_connect?(requester_id, addressee_id)
    Friendship.where(requester_id: requester_id, addressee_id: @current_user).first
  end

  def is_friend?(requester_id, addressee_id)
    Friendship.where(requester_id: requester_id, addressee_id: addressee_id, status: "accepted").first ||
    Friendship.where(requester_id: addressee_id, addressee_id: requester_id, status: "accepted").first
    # @friend_ship.status = "accepted"
  end
  #
  # def current_user
  #   signed_in? ? User.find(session[:current_user_id]) : nil
  # end
  #
  # def signed_in?
  #   !session[:current_user_id].nil?
  # end
end
