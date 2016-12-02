# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

subway = ->
  $('.subway')
    .on 'ajax:success', (e, data, status, xhr) ->
      # target = $(e.target)
      # target = $(e.target).parents('.question-vote')
      # if (target.hasClass('question-vote'))
      stations = $.parseJSON(xhr.responseText)
      $('.stations').empty()
      for station, index in stations
        # console.log(station)
        elem = index.toString() + ' ' + station + "<br>"
        $('.stations').append(elem)

    .bind 'ajax:error', (e, xhr, status, error) ->
      errors = $.parseJSON(xhr.responseText)['errors']
      $('.stations').empty()
      # console.log(typeof errors)
      $.each errors, (index, error) ->
        elem = index.toString() + ' ' + error + "<br>"
        $('.stations').append(elem)

$ ->
  subway()
