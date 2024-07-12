class User < ApplicationRecord
  has_one_attached :image
  has_many :books, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  def get_image(width, height)
    if image.attached?
      image.variant(resize_to_limit: [width, height]).processed
    else
      # デフォルトの画像を表示するための処理
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      image_tag(file_path, alt: "Default Image", width: width, height: height)
    end
  end
end
