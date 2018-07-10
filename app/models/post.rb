class Post < ApplicationRecord
  validates :title, :image_url, :article, :category, presence: true;
  validates_length_of :preview, :minimum => 5, :maximum => 250, :allow_blank => true
end
