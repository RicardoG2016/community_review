class Post < ApplicationRecord
  acts_as_votable
  belongs_to :user
  has_many :comments
  has_attached_file :image, styles: { medium: "700x500#", small: "350x250#", thumb: "100x100>" }, :default_url => "/public/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
