class Word < ActiveRecord::Base
  has_attached_file :picture,
    :styles => {
      :medium => "300x300>",
      :thumb => "100x100>"
    },
    :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  scope :random, limit(4).order("RANDOM()")

  def prefixes
    ((self.class.random.pluck(:prefix) - [prefix])[0..-1] + [prefix]).shuffle
  end

  def suffixes
    ((self.class.random.pluck(:suffix) - [suffix])[0..-1] + [suffix]).shuffle
  end
end
