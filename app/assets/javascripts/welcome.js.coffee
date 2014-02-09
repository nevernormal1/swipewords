# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(() ->
  activeLabel = null
  activeSuffix = null

  completeWord = (prefix, suffix) ->
    word = prefix + suffix
    wordContainer = $("#word-container")
    correctWord = wordContainer.data("value")

    if word is correctWord
      SWPWRD.wordLoader().load()
      #wordContainer.effect("explode")
    else
      wordContainer.effect("shake")

  $("#prefixes").on("mousedown touchstart", ".prefix", () ->
    label = $(this)
    label.switchClass("label-default", "label-info", 100)
    activeLabel = label
  )

  $("#suffixes").on("mouseenter", ".suffix", () ->
    if activeLabel
      label = $(this)
      label.switchClass("label-default", "label-info", 100)
      activeSuffix = label
  )

  $("#suffixes").on("mouseout", ".suffix", () ->
    if activeSuffix
      activeSuffix.switchClass("label-info", "label-default", 100)
      activeSuffix = null
  )

  $(document).on("mouseup touchend", () ->
    if activeLabel
      if activeSuffix
        completeWord(activeLabel.text(), activeSuffix.text())
        activeSuffix.switchClass("label-info", "label-default", 100)
        activeSuffix = null

      activeLabel.switchClass("label-info", "label-default", 100)

      activeLabel = null
  )

  $(document).mousemove((e) ->
    e.preventDefault()
  )
)
