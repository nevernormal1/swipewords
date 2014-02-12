class Word < ActiveRecord::Base
  has_attached_file :picture,
    :styles => {
      :medium => "300x300>",
      :thumb => "100x100>"
    },
    :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  def self.random
    limit(1).order("RANDOM()")
  end

  def self.randomGroup
    limit(4).order("RANDOM()")
  end

  def prefixes
    ((self.class.randomGroup.pluck(:prefix) - [prefix])[0..2] + [prefix]).shuffle
  end

  def suffixes
    ((self.class.randomGroup.pluck(:suffix) - [suffix])[0..2] + [suffix]).shuffle
  end
end
