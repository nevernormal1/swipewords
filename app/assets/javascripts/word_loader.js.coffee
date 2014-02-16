window.SWPWRD ?= {}

SWPWRD.wordLoader = do () ->
  that = {}
  currentWord = null
  nextWord = null
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
    fillBuffer({complete: initial})

  initial = () ->
    nextWord = SWPWRD.word(words.shift())
    $("#next-word").html(nextWord.pictureImg())
    next()

  next = () ->
    if words.length > 0
      if currentWord
        $("#word-container img").fadeOut()

      currentWord = nextWord
      $("#word-container").empty()
      $("#word-container").data("value", currentWord.getValue())
      $("#word-container").append($("#next-word img"))
      $("#word-container").fadeIn()
      currentWord.render()

      # Load next word into "next" word
      nextWord = SWPWRD.word(words.shift())
      $("#next-word").html(nextWord.pictureImg())

      fillBuffer()
    else
      fillBuffer({complete: next})

  that.load = load
  that.next = next

  that

