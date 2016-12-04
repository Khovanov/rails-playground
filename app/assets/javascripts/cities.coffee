# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

subway = ->
  $('.subway')
    .on 'ajax:success', load_stations
    .bind 'ajax:error', show_errors
    # .on 'ajax:success', load_stations
    # .bind 'ajax:error', show_errors
    
city = ->
  $('.city')
    .on 'change', (e) -> 
      # e.preventDefault();
      elem = $(this).prop('value')
      url = "/cities/" + elem + "/subway"
      # $.getJSON(url)
      jqxhr = $.get(url)
      jqxhr.done (data) ->
        append_items(data)
      jqxhr.fail (xhr) ->
        # console.log(xhr.responseText)
        append_items($.parseJSON(xhr.responseText)['errors'])

    # .on 'ajax:success', load_stations
    # .bind 'ajax:error', show_errors

load_stations = (e, data, status, xhr) ->
  append_items($.parseJSON(xhr.responseText))

show_errors = (e, xhr, status, error) ->
  append_items($.parseJSON(xhr.responseText)['errors'])

append_items = (array) ->
  $('.stations').empty()
  item = $('.item')
  stations = $('.stations')
  for value, index in array
    # console.log(value)
    elem = item.clone().removeClass("hide")
    elem.find('label').append(value)
    elem.find('input').prop('name', 'st' + index)
    # console.log(elem)
    stations.append(elem)

  # $.each errors, (index, error) ->
  #   elem = index.toString() + ' ' + error + "<br>"
  #   $('.stations').append(elem)

$ ->
  subway()
  city()
