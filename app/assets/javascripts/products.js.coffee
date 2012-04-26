# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('#product_carousel').carousel()

  $('#add_to_cart').click ->
    $.ajax({
      url: '/line_items/new?product_id=' + $('#add_to_cart').attr('product_id'),
      type: 'POST',
      success: (data) ->
        $('#cart').html(data)
    })

  
