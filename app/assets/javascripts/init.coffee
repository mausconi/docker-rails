class @Init
  constructor: ->
    new AhoyTracker()

    # Forms
    new FormValidator()
    new Upload()

    # General
    new TimeFormatter()
    new TooltipEnabler()
    new Autocomplete()

$(document).on 'turbolinks:load', ->
  new Init()
