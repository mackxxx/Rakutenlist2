class Item < ApplicationRecord
  validates :code, presence: true, length: { maximum: 255 }
  validates :name, presence: true, length: { maximum: 255 }
  validates :url, presence: true, length: { maximum: 255 }
  validates :image_url, presence: true, length: { maximum: 255 }

  def self.initialize_by_json(json)
    new(
      code: json['itemCode'],
      name: json['itemName'],
      url: json['itemUrl'],
      image_url: json['mediumImageUrls'].first.gsub('?_ex=128x128', '')
    )
  end
end