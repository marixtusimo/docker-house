class Like < ApplicationRecord
    belongs_to :user
    belongs_to :post
    validates_uniqueness_of :post_id, scope: :user_id
    def liked_by?(post_id)
        likes.where(post_id: post_id).exists?
    end
end
