# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('#product_carousel').carousel()

  $('#add_to_cart').click ->
    $.ajax({
      url: '/line_items?product_id=' + $('#add_to_cart').attr('product_id') + '&quantity=' + $('#quantity').val(),
      type: 'POST',
      success: (data) ->
        $('#cart').html(data)
    })

  $('#product_size').change ->
    if $('#product_size').val() == 'Choose Size'
      $('#product_quantity').fadeOut()
      $('#add_to_cart').addClass('disabled') if !$('#add_to_cart').hasClass('disabled')
    else
      $('#add_to_cart').removeClass('disabled') if $('#add_to_cart').hasClass('disabled')
      $.ajax({
        url: '/products/quantity?size=' + $('#product_size').val() + '&product_id=' + $('#product_quantity').attr('product_id'),
        type: 'GET',
        success: (data) ->
          $('#product_quantity').html(data)
          $('#product_quantity').fadeIn()
      })
