class Post < ApplicationRecord
    with_options presence: true do
        validates :title
        validates :station
        validates :price, inclusion: { in: 10000..9_999_999 }, format:{with: /\A[0-9]+\z/}#半角数字のみOK
        validates :floor
        validates :construction
        validates :access
        validates :location
        validates :build
        validates :security
        validates :equipment
        validates :facility
        validates :image
    end
    has_one_attached :image
    belongs_to :owner
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    def self.search(search)
        if search != ''
            Post.where('station LIKE(?)', "%#{search}%")
        else
            Post.all
        end
    end
end
