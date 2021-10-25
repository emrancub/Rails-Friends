module FriendshipsHelper
  def is_requested?(requester_id, addressee_id)
    Friendship.where(requester_id: requester_id, addressee_id: addressee_id).first
  end

  def is_connect?(requester_id, addressee_id)
    Friendship.where(requester_id: requester_id, addressee_id: addressee_id).first
  end

  def is_friend?(requester_id, addressee_id)
    Friendship.where(requester_id: requester_id, addressee_id: addressee_id, status: "accepted").first ||
    Friendship.where(requester_id: addressee_id, addressee_id: requester_id, status: "accepted").first
  end
end
