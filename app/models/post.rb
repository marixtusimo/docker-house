class Post < ApplicationRecord
    with_options presence: true do
        validates :title
        validates :station
        validates :price
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
end
