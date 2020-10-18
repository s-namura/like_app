class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  # post.liked_users で post を「いいね！」しているユーザーの一覧を取得できるようになる
  has_many :liked_users, through: :likes, source: :user
  validates :content, presence: true
  # postをuserが「いいね！」している時は「true」，「いいね」していない時は「false」
  def liked_by?(user)
    likes.find_by(user_id: user.id).present?
  end

end
