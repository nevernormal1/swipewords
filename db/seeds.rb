# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


def image_path
  "#{Rails.root}/spec/fixtures/"
end

def create_word(value, prefix, suffix, filename)

  Word.create!(
    :value => value,
    :prefix => prefix,
    :suffix => suffix,
    :picture => File.new(image_path + filename)
  )
end

create_word "brick", "br", "ick", "brick.jpg"

create_word "clam", "cl", "am", "clam.jpg"
create_word "cloud", "cl", "oud", "cloud.jpg"
create_word "cow", "c", "ow", "cow.jpg"

create_word "flower", "fl", "ower", "flower.jpg"

create_word "plant", "pl", "ant", "plant.jpg"
create_word "plow", "pl", "ow", "plow.jpg"

create_word "shark", "sh", "ark", "shark.jpg"
create_word "shirt", "sh", "irt", "shirt.jpg"
create_word "skunk", "sk", "unk", "skunk.jpg"
create_word "snail", "sn", "ail", "snail.jpg"

create_word "tree", "tr", "ee", "tree.jpg"




# Ar
# An
#
# Br
# Cr
# Dr
#
# Fl
# Fr
# Gr
# Pr
#
