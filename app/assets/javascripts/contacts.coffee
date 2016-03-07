# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  $('#search').select2 theme: 'bootstrap'

  $("#search-form").on("ajax:success", (e, data, status, xhr) ->
    $("#contact").replaceWith xhr.responseText
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#contact").append "<p>ERROR</p>"
    
  $("#contact").on("ajax:success", (e, data, status, xhr) ->
    $("#contact").replaceWith xhr.responseText
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#contact").append "<p>ERROR</p>"

 
  return