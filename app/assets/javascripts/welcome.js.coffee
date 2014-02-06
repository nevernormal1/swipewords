# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(() ->
  activeLabel = null
  activeSuffix = null
  correctWord = $("#word-container").data("value")

  completeWord = (prefix, suffix) ->
    word = prefix + suffix

    if word is correctWord
      alert("Correct")
    else
      alert("Incorrect")

  $("#prefixes").on("mousedown", ".prefix", () ->
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

  $(document).mouseup(() ->
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
