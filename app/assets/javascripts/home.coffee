@searchProduct = (x) ->
  $.ajax
    url: "/products.json?code=x"
    error: (y) ->
      searchBarcode(x)
    success: (x) ->
      $("#donate_product_id").val(x.id)
      $("#donate_product_id").trigger('change')
      $("#barcode").val(x.code)
      $("#photo").html("<img class='img-fluid' src='#{x.photo_url}'/>")

@searchBarcode = (x) ->
  $.ajax
    headers: {"X-Cosmos-Token": "tlfc0QU8XEA-ZZmFLcGzlw"}
    url: "https://api.cosmos.bluesoft.com.br/gtins/#{x}"
    error: (x) ->
      initialize()
      load_quagga()
    success: (y) ->
      saveProduct(y)

@saveProduct = (x) ->
  data = 
    'product[name]': x.description
    'product[code]': x.gtin
    'product[price]': x.price
    'product[quantity]': x.gtins[0].commercial_unit.quantity_packaging
    'product[kind]': x.gtins[0].commercial_unit.type_packaging
    'product[photo_url]': x.thumbnail
  $.ajax
    url: '/products.json'
    type: 'post'
    data: data
    error: (data) ->
      initialize()
    success: (y) ->
      $('#barcode-scanner').hide()
      loadProducts()
      setTimeout ->
        $("#donate_product_id").val(x.id)
        $("#donate_product_id").trigger('change')
        $("#barcode").val(x.code)
        $("#photo").html("<img class='img-fluid' src='#{x.photo_url}'/>")
      , 500

@initialize = ->
  $("#donate_product_id").val("")
  $("#barcode").val("")
  $('#barcode-scanner').show()
  $("#photo").html("")

@loadProducts = ->
  container = $("#donate_product_id" )
  container.html("<option></option>")
  $.ajax
    url: "/products.json"
    success: (x) ->
      for u in x
        container.append("<option value='#{u.id}'>#{u.name}</option>")
@loadActs = ->
  container = $("#donate_act_id")
  container.html("<option></option>")
  $.ajax
    url: "/acts.json"
    success: (x) ->
      for u in x
        container.append("<option value='#{u.id}'>#{u.name}</option>")

$(document).on 'turbolinks:load', ->
  $("#addProduct").on "shown.bs.modal", ->
    loadProducts()
    loadActs()
    initialize()
    load_quagga()

  $("#addProduct").on "hidden.bs.modal", ->
   Quagga.stop()

  $(document).on 'click', "#reload", ->
    load_quagga()

  $(document).on "change", "#barcode", (e) ->
    barcode = $(e.target).val()
    searchProduct(barcode)
  $(document).on "change", "#donate_product_id", (e) ->
    Quagga.stop()
    $('#barcode-scanner').hide()
    id = $(e.target).val()
    $.ajax
      url: "/products/#{id}.json"
      success: (data) ->
        $("#photo").html("<img class='img-fluid' src='#{data.photo_url}'/>")

    