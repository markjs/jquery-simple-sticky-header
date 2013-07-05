###
# jQuery Simple Sticky Header
# Copyright 2013 Mark J Smith
###

(($) ->

  $.fn.simpleStickyHeader = (options = {}) ->
    options = $.extend
      'offset': 0
    , options

    $(this).each ->
      $this = $(this).addClass('simple-static')
      $this.after $this.clone().removeClass('simple-static').addClass('simple-sticky').hide()

      $(window).on 'scroll', ->
        $static = $(".simple-static")
        $sticky = $(".simple-sticky")

        if $(window).scrollTop() >= ($static.position()['top'] - options.offset)
          $sticky.show()
        else
          $sticky.hide()

      $(window).trigger 'scroll'

)(jQuery)
