window.SWPWRD ?= {}

SWPWRD.word = (data) ->
  value = data.value
  prefixes = data.prefixes
  suffixes = data.suffixes
  pictureUrl = data.pictureUrl

  that = {}

  getValue = () ->
    value

  pictureImg = () ->
    $("<img>", {src: pictureUrl})

  render = () ->
    #$("#word-container").data("value", word).html(pictureImg())
    #$("#word-container").show()

    $("#prefixes").empty()
    $("#suffixes").empty()

    for prefix in prefixes
      $("#prefixes").append($("<li>").append($("<span>", {'class': "prefix label label-default"}).text(prefix)))

    for suffix in suffixes
      $("#suffixes").append($("<li>").append($("<span>", {'class': "suffix label label-default"}).text(suffix)))


  that.pictureImg = pictureImg
  that.render = render
  that.getValue = getValue

  that

