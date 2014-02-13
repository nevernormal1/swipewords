window.SWPWRD ?= {}

SWPWRD.wordLoader = do () ->
  that = {}

  that.load = () ->
    $.getJSON('/words.json', (data) ->
      SWPWRD.word(data).render()
    )

  that

