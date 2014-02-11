# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(() ->
  activeLabel = null
  activeSuffix = null
  lastSuffix = null

  completeWord = (prefix, suffix) ->
    word = prefix + suffix
    wordContainer = $("#word-container")
    correctWord = wordContainer.data("value")

    if word is correctWord
      SWPWRD.wordLoader().load()
      #wordContainer.effect("explode")
    else
      wordContainer.effect("shake")

  overSuffix = (clientX, clientY) ->
    for element in $(".suffix").get()
      rect = element.getBoundingClientRect()

      if clientX >= rect.left && clientX <= rect.right && clientY >= rect.top && clientY <= rect.bottom
        return $(element)

    null

  activateSuffix = (suffix) ->
    if activeLabel
      suffix.switchClass("label-default", "label-info", 100)
      activeSuffix = suffix

  deactivateSuffix = () ->
    if activeSuffix
      activeSuffix.switchClass("label-info", "label-default", 100)
      lastSuffix = activeSuffix
      activeSuffix = null

  detectHit = (clientX, clientY) ->
    if activeLabel
      if activeSuffix
        completeWord(activeLabel.text(), activeSuffix.text())
        activeSuffix.switchClass("label-info", "label-default", 100)
        activeSuffix = null
      else if lastSuffix
        offset = lastSuffix.offset()
        if clientX > (offset.left + lastSuffix.width())
          completeWord(activeLabel.text(), lastSuffix.text())
          lastSuffix = null

      activeLabel.switchClass("label-info", "label-default", 100)

      activeLabel = null

  $(document).on("mousemove touchmove", (e) ->
    e.preventDefault()
  )

  $(document).on("touchmove", (e) ->
    touch = e.originalEvent.targetTouches[0]
    suffix = overSuffix(touch.clientX, touch.clientY)

    if suffix
      activateSuffix(suffix)
    else
      deactivateSuffix()
  )

  $("#prefixes").on("mousedown touchstart", ".prefix", () ->
    label = $(this)
    label.switchClass("label-default", "label-info", 100)
    activeLabel = label
  )

  $("#suffixes").on("mouseenter", ".suffix", () ->
    activateSuffix($(this))
  )

  $("#suffixes").on("mouseleave", ".suffix", deactivateSuffix)

  $(document).on("mouseup", (e) ->
    detectHit(e.pageX, e.pageY)
  )

  $(document).on("touchend", (e) ->
    touch = e.originalEvent.changedTouches[0]
    detectHit(touch.clientX, touch.clientY)
  )

)
