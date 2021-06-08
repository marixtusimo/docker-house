class Owner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true#空では登録できない
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }#半角英数混合でなければ登録できない
  has_many :posts, dependent: :destroy   
  def self.guest
    find_or_create_by!(email: 'guest2@example.com') do |owner|
      owner.password = SecureRandom.urlsafe_base64
      owner.name = 'ゲスト'
    end
  end  
end
