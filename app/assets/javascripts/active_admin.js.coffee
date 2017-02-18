#= require active_admin/base
#= require vendor/jquery.mask.js
#= require jquery.ui.autocomplete
$(document).ready ->
  $('#user_cnic').mask '00000-0000000-0'
  $('#student_cnic').mask '00000-0000000-0'
  $('#user_phone').mask '+92-000-0000000'
  return

$ ->
  $('.autocomplete').each (index, input) ->
    $input = $(input)
    $hiddenInput = $($(input).data('hidden-input'))

    $input
      .autocomplete
        minLength: 3
        delay: 600
        source: (request, response) ->
          $.ajax
            url: $input.data('url')
            dataType: 'json'
            data:
              term: request.term
            success: (data) -> response(data)
        select: (event, ui) ->
          $input.val(ui.item.label)
          $hiddenInput.val(ui.item.id)
          false
      .data('ui-autocomplete')._renderItem = (ul, item) ->
        $('<li></li>')
         .data('item.autocomplete', item)
         .append('<a>' + item.label + '</a>')
         .appendTo(ul)
