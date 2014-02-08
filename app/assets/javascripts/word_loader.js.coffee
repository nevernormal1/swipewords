window.SWPWRD ?= {}

SWPWRD.wordLoader = () ->
  that = {}

  that.load = () ->
    $.getJSON('/words.json', (data) ->
      SWPWRD.word(data).render()
    )

  that

