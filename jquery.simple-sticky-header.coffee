###
# jQuery Simple Sticky Header
# Copyright 2013 Mark J Smith
###

(($) ->

  $.fn.simpleStickyHeader = (options = {}) ->
    options = $.extend
      'offset': 0

    stickyId = 0

    $(this).each ->
      stickyId++
      $this = $(this).attr('data-sticky-id', stickyId).addClass('simple-static')
      $this.after $this.clone().removeClass('simple-static').addClass('simple-sticky').hide()

      $(window).on 'scroll', ->
        $static = $(".simple-static[data-sticky-id=#{stickyId}]")
        $sticky = $(".simple-sticky[data-sticky-id=#{stickyId}]")
        if $(window).scrollTop() >= $static.position()['top']
          $sticky.show()
        else
          $sticky.hide()

)(jQuery)
