# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(() ->
  activeLabel = null
  activeSuffix = null

  $("#prefixes").on("mousedown", ".prefix", () ->
    label = $(this)
    label.removeClass("label-default").addClass("label-info")
    activeLabel = label
  )

  $("#suffixes").on("mouseenter", ".suffix", () ->
    if activeLabel
      label = $(this)
      label.removeClass("label-default").addClass("label-info")
      activeSuffix = label
  )

  $("#suffixes").on("mouseout", ".suffix", () ->
    if activeSuffix
      activeSuffix.removeClass("label-info").addClass("label-default")
      activeSuffix = null
  )

  $(document).mouseup(() ->
    if activeLabel

      if activeSuffix
        alert("Selected word #{activeLabel.text()}#{activeSuffix.text()}")
        activeSuffix.removeClass("label-info").addClass("label-default")
        activeSuffix = null

      activeLabel.removeClass("label-info").addClass("label-default")

      activeLabel = null
  )

  $(document).mousemove((e) ->
    e.preventDefault()
  )
)
