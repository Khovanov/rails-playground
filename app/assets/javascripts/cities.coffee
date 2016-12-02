# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

subway = ->
  $('.subway')
    .on 'ajax:success', (e, data, status, xhr) ->
      load_stations($.parseJSON(xhr.responseText))
    .bind 'ajax:error', (e, xhr, status, error) ->
      show_errors($.parseJSON(xhr.responseText)['errors'])

select_city = ->
  # $('.city').on 'click', '.abc', (e) -> 
  $('.city')
    .on 'change', (e) -> 
      # e.preventDefault();
      $('.stations').empty()
      elem = $(this).prop('value')
      $('.stations').append(elem)

      url = "/cities/" + elem + "/subway"
      # $.get(url: url, load_stations)
      # jqxhr = $.get url, (data) ->
      jqxhr = $.get(url)
      jqxhr.done (data) ->
        load_stations(data)
      jqxhr.fail (xhr) ->
        # console.log(xhr.responseText)
        show_errors($.parseJSON(xhr.responseText)['errors'])

load_stations = (stations) ->
  # target = $(e.target).parents('.parent-class')
  # if (target.hasClass('parent-class'))
  $('.stations').empty()
  for station, index in stations
    # console.log(station)
    elem = index.toString() + ' ' + station + "<br>"
    $('.stations').append(elem)

show_errors = (errors) ->
  $('.stations').empty()
  # console.log(typeof errors)
  $.each errors, (index, error) ->
    elem = index.toString() + ' ' + error + "<br>"
    $('.stations').append(elem)  

$ ->
  subway()
  select_city()
