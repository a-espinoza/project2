class Post < ActiveRecord::Base
  validates :image, presence: true

  has_attached_file :image, styles: { :medium => "480x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
#this i got from the paperclip gem documentation + validation and require picture!rails s
