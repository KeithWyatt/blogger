class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")  
  end

  def tag_list=(tags_string)
    tag_list = tags_string.split(",").map { |tag| tag.strip.downcase }.uniq
    self.tags = tag_list.map { |tag| Tag.find_or_create_by(name: tag) }
  end
end
