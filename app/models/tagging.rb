class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :image
  # attr_accessible :title, :body
end
