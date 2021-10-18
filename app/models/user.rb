class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, :gender, presence: true
  has_many :friends

  has_many :requester_friendships, class_name: 'Friendship', foreign_key: 'requester_id'
  has_many :addressee_friendships, class_name: 'Friendship', foreign_key: 'addressee_id'

  # has_many :incoming_friend_requests,class_name: 'Friendship',source: :friend
end
