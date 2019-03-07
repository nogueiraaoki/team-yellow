$(document).on "turbolinks:load", ->
  $(".select2").select2
    dropdownParent: $('#addProduct')
    width: 'resolve'


  @getProduct = (code) ->
    