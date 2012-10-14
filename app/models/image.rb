class Image < ActiveRecord::Base
  attr_accessible :title, :filename, :description, :selected
  has_many :taggings
  has_many :tags, :through => :taggings

  default_scope order("filename DESC")

  scope :selected, where(:selected => true)
  scope :not_selected, where(:selected => false)

  def self.with_tag_outside
    joins(:tags).where("tags.name" => "outside")
  end
end
