window.SWPWRD ?= {}

SWPWRD.wordLoader = do () ->
  that = {}
  currentWord = null
  nextWord = null
  url = null
  words = []

  maxBufferLength = 4

  retrievingWords = false

  wordsInPipeline = () ->
    ret = []
    ret.push(currentWord.getValue()) if currentWord
    ret.push(nextWord.getValue()) if nextWord


    ret = ret.concat (word.value for word in words)

  fillBuffer = (params = {}) ->
    unless retrievingWords || words.length >= maxBufferLength
      retrievingWords = true

      $.getJSON(url, {exclude_words: wordsInPipeline()}, (newWords) ->
        words = words.concat(newWords)
        retrievingWords = false

        if params.complete?
          params.complete()
      )

  init = (options) ->
    url = options.url

    fillBuffer(
      complete: () ->
        loadNextWord()
        transitionWords()
    )

  loadNextWord = () ->
    nextWord = SWPWRD.word(words.shift())
    $("#next-word").html(nextWord.pictureImg())

  transitionWords = () ->
    if words.length > 0
      if currentWord
        $("#word-container img").fadeOut()

      currentWord = nextWord
      $("#word-container").empty()
      $("#word-container").data("value", currentWord.getValue())
      $("#word-container").append($("#next-word img"))
      $("#word-container").fadeIn()
      currentWord.render()

      loadNextWord()

      fillBuffer()
    else
      fillBuffer({complete: transitionWords})

  that.init = init
  that.transitionWords = transitionWords

  that

