window.SWPWRD ?= {}

SWPWRD.wordLoader = do () ->
  that = {}
  words = []

  maxBufferLength = 4

  retrievingWords = false

  fillBuffer = (params = {}) ->
    unless retrievingWords || words.length >= maxBufferLength
      retrievingWords = true

      $.getJSON('/words.json', (newWords) ->
        words = words.concat(newWords)
        retrievingWords = false

        if params.complete?
          params.complete()
      )

  load = () ->
    fillBuffer({complete: next})

  next = () ->
    if words.length > 0
      word = words.shift()
      SWPWRD.word(word).render()
      fillBuffer()
    else
      fillBuffer({complete: next})

  that.load = load
  that.next = next

  that

