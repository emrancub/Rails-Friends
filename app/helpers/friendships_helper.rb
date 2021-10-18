module FriendshipsHelper
  def is_requested?(requester_id, addressee_id)
    Friendship.where(requester_id: requester_id, addressee_id: addressee_id).first
  end

  def is_connect?(requester_id, addressee_id)
    Friendship.where(requester_id: requester_id, addressee_id: @current_user).first
  end
end
