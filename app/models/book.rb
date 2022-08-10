class Book < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  validates :image, presence: true
  validates :title, presence: true, length: { maximum: 50 }

  def get_book_image
    unless image.attached?
      file_path = Rails.root.join("app/assets/images/no_book_image.jpg")
      image.attach(io: File.open(file_path), filename: "default-book.jpg", content_type: "image/jpeg")
    end
    image
  end
end
