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

def create_words(prefix, *values)
  values.each do |value|
    create_word(value, prefix)
  end
end

def create_word(value, prefix)
  suffix = value.split(prefix).last

  Word.create!(
    :value => value,
    :prefix => prefix,
    :suffix => suffix,
    :picture => File.new(image_path + "#{value}.jpg")
  )
end

# Ar
# An
#
# Bl
# Blast
create_words "bl", "blocks"

# Br
create_words "br", "braid", "brain", "branch", "bread", "brick", "broom"

# Ch
create_words "ch", "chair", "cheese", "cherry", "chips"

# Cl
# Clip
create_words "cl", "clam", "cloud", "clock"
# Cr
create_words "cr", "crab", "crib", "crown"

# Dr
create_words "dr", "dress", "drill", "drum"
#
# Ex
#
# Fl
create_words "fl", "flower", "flag"

# Fr
create_words "fr", "fry"

# Friends
#
# Gl
create_words "gl", "globe", "glove", "glue"

#
# Gr
create_words "gr", "grapes", "grate"

# Green
# Grouch
# Grow
# Growl
#
# Kn
create_words "kn", "knife", "knight"
#
# Ph
create_words "ph", "phone"
#
# Pl
create_words "pl", "plane", "plant", "plate", "plow", "plug"
#
# Pr
#
# Qu
create_words "qu", "quilt"

# Sc
create_words "sc", "scarf", "scissors"

# Sch
create_words "sch", "school"

# Sh
create_words "sh", "shark", "shirt", "shelf"

# Sk
create_words "sk", "skate", "skirt", "skunk"

# Sl
create_words "sl", "slinky", "slime"

# Sn
create_words "sn", "snail", "snake", "snow"

# Sp
create_words "sp", "spiral", "spoon"

# Spl
create_words "spl", "splash"

# Sq
create_words "sq", "squid", "square"

# St
create_words "st", "star", "stairs", "stick"
create_words "str", "string"

# Sw
create_words "sw", "switch", "sword", "swing"

# Th
#
# Thr
create_words "thr", "thread"

# Tr
create_words "tr", "trash", "tree", "trophy", "truck"


# Wh
create_words "wh", "whale", "wheel", "whip"

# Wr
create_words "wr", "wreath", "wrench"


