class Book < ApplicationRecord
  belongs_to :user
  attachment :image


  validates :title,  presence: true, length: { in: 2..200 }
  validates :body, presence: true, length: { in: 2..200 }
end
