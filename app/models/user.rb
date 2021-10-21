class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, :gender, presence: true
  has_many :friends

  has_many :requester_friendships, class_name: 'Friendship', foreign_key: 'requester_id'
  has_many :addressee_friendships, class_name: 'Friendship', foreign_key: 'addressee_id'

  # starts from here............
  # add the text
  # has_many :friendships
  # has_many :friends, :through => :friendships, :conditions => "status = 'accepted'"
  # # end the text
  # has_and_belongs_to_many :friends, after_add: :create_complement_friendship,
  #                         after_remove: :remove_complement_friendship
  #
  # private
  # def create_complement_friendship(friend)
  #   friend.friends << self  unless friend.friends.include?(self)
  # end
  #
  # def remove_complement_friendship(friend)
  #   friend.friends.delete(self)
  # end
  # end here ...........


  # has_many :incoming_friend_requests,class_name: 'Friendship',source: :friend
  # has_many :friendships
  # has_many :pending_invitations, -> { where confirmed: false }, class_name: 'Friendship', foreign_key: "addressee_id"
  #
  # def friends
  #   friends_i_sent_invitation = Friendship.where(requester_id: id, confirmed: true).pluck(:addressee_id)
  #   friends_i_got_invitation = Friendship.where(addressee_id: id, confirmed: true).pluck(:requester_id)
  #   ids = friends_i_sent_invitation + friends_i_got_invitation
  #   User.where(id: ids)
  # end
  #
  # def friend_with?(user)
  #   Friendship.confirmed_record?(id, user.id)
  # end
  #
  # def send_invitation(user)
  #   Friendship.create(friend_id: user.id)
  # end
end
