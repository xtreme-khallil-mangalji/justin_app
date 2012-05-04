class Tweet < ActiveRecord::Base
  attr_accessible :image_url, :text, :title
end
