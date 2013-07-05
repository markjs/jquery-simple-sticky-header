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
          unless $sticky.is(':visible')
            $sticky.show()
            $sticky.trigger('simpleSticky.show', [$sticky, $static])
        else
          if $sticky.is(':visible')
            $sticky.hide()
            $sticky.trigger('simpleSticky.hide', [$sticky, $static])

      $(window).trigger 'scroll'

)(jQuery)
