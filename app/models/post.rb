class Post < ApplicationRecord
  acts_as_taggable # Alias for acts_as_taggable_on :tags
  validates :name, :presence => true
  validates :banner_image_url, :presence => true
  validates :title, :presence => true,
    :length => { :minimum => 5 }
  validates :content, :presence => true,
    :length => { :minimum => 5 }
end
