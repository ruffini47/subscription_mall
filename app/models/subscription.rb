class Subscription < ApplicationRecord
  belongs_to :owner
  # belongs_to :shop
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  enum price: { "3,000"=> 1, "12,000"=> 2, "18,000"=> 3, "25,000"=> 4, "50,000"=> 5, "100,000"=> 6}, _prefix: true
  enum monthly_fee: { "1980"=> 1, "4980"=> 2, "19800"=> 3}
  enum category_name: { "和食"=> 1, "洋食"=> 2, "中華"=> 3, "イタリアン"=> 4, "フレンチ"=> 5, "ハワイアン"=> 6, "東南アジア料理"=> 7, "韓国料理"=> 8, "その他"=> 9}, _prefix: true
  enum category_genre: { "カフェ"=> 1, "らーめん"=> 2, "パン屋"=> 3, "カレー"=> 4, "居酒屋"=> 5, "バー"=> 6, "ケーキ"=> 7, "焼肉"=> 8, "定食屋"=> 9, "ハンバーガー"=> 10, "レストラン"=> 11}, _prefix: true
  # attachment :image_subscription
  mount_uploader :image_subscription, ImageUploader
  mount_uploader :image_subscription2, ImageUploader
  mount_uploader :image_subscription3, ImageUploader
  mount_uploader :image_subscription4, ImageUploader

  validates :category_name, presence: true
end
