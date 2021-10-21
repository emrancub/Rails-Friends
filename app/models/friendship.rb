class Friendship < ApplicationRecord
  belongs_to :requester, class_name: 'User'
  belongs_to :addressee, class_name: 'User'

  # after_save :created_friendship
  #
  # def accept
  #   update_attributes(:status  => 'accepted')
  # end
  #
  # private
  # def created_friendship
  #   sender.friends << receiver  if status_changed? && status == 'accepted'
  # end
  # belongs_to :user
  #
  # def self.reacted?(id1, id2)
  #   case1 = !Friendship.where(requester_id: id1, addressee_id: id2).empty?
  #   case2 = !Friendship.where(requester_id: id2, addressee_id: id1).empty?
  #   case1 || case2
  # end
  #
  # def self.confirmed_record?(id1, id2)
  #   case1 = !Friendship.where(requester_id: id1, addressee_id: id2, confirmed: true).empty?
  #   case2 = !Friendship.where(requester_id: id2, addressee_id: id1, confirmed: true).empty?
  #   case1 || case2
  # end
  #
  # def self.find_friendship(id1, id2)
  #   if Friendship.where(requester_id: id1, addressee_id: id2, confirmed: true).empty?
  #     Friendship.where(requester_id: id2, addressee_id: id1, confirmed: true)[0].id
  #   else
  #     Friendship.where(requester_id: id1, addressee_id: id2, confirmed: true)[0].id
  #   end
  # end
end
