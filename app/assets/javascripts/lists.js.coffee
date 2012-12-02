# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).on('click', '.add_level', ( ->
  $.post "/lists/#{this.getAttribute('data-list-id')}/add_level/#{this.getAttribute('data-level-id')}", ->
    location.reload();
));

# jQuery ->
#   if $('#levels').length > 0
#     $('#levels').sortable
#       axis: 'y'
#       handle: '.handle'
#       update: ->
#         $.post($(this).data('update-url'), $(this).sortable('serialize'))
