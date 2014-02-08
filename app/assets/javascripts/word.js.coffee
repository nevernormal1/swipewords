window.SWPWRD ?= {}

SWPWRD.word = (data) ->
  word = data.value
  prefixes = data.prefixes
  suffixes = data.suffixes
  pictureUrl = data.pictureUrl

  that = {}

  pictureImg = () ->
    $("<img>", {src: pictureUrl})

  that.render = () ->
    $("#word-container").data("value", word).html(pictureImg())

    $("#prefixes").empty()
    $("#suffixes").empty()

    for prefix in prefixes
      $("#prefixes").append($("<li>").append($("<span>", {'class': "prefix label label-default"}).text(prefix)))

    for suffix in suffixes
      $("#suffixes").append($("<li>").append($("<span>", {'class': "suffix label label-default"}).text(suffix)))


  that

