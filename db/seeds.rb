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

create_word "shirt", "sh", "irt", "shirt.jpg"

create_word "plant", "pl", "ant", "plant.jpg"

create_word "tree", "tr", "ee", "tree.jpg"

