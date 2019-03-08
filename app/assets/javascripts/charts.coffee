getActs = (selector) ->
  $.ajax
    url: "/act/request.json"
    success: (data) ->
      renderChartMix(data, selector)
getProducts = (selector) ->
  $.ajax
    url: "/product/request.json"
    success: (data) ->
      renderChartpie(data, selector)
getDonates = (selector) ->
  $.ajax
    url: "/donate/request.json"
    success: (data) ->
      renderChartline(data, selector)

renderChartMix = (data, selector) ->
  colors = []
  for u in data.atual
    colors.push "rgb(#{Math.floor(Math.random() * 255)},#{Math.floor(Math.random() * 255)},#{Math.floor(Math.random() * 255)})"
  new Chart(selector, {
    type: 'bar'
    data:
      datasets: [{
        label: "Atual"
        data: [0].concat(data.atual)
        backgroundColor: [''].concat(colors)
      }
      {
        label: "Meta"
        data: [0].concat(data.acts)
        type: "line"
      }]
      labels: [''].concat(data.labels)
  })
renderChartpie = (data, selector) ->
  colors = []
  for u in data.values
    colors.push "rgb(#{Math.floor(Math.random() * 255)},#{Math.floor(Math.random() * 255)},#{Math.floor(Math.random() * 255)})"
  new Chart(selector, {
    type: 'pie'
    options:
      legend: false
    data:
      datasets:[{
        data: data.values
        backgroundColor: colors
      }]
      labels: data.labels
  })
renderChartline = (data, selector) ->
  new Chart(selector, {
    type: 'line'
    data:
      datasets:[{
        label: 'Ideal'
        data: data.ideal
        borderColor: ['green']
      }
      {
        label: 'Atual'
        data: data.atual
        borderColor: ['yellow']
      }
      ]
      labels: data.labels
  })

@reloadChart = ->
  goal_acts = $("#goal_acts")
  top_products = $("#top_products")
  user_donates = $("#user_donates")
  if goal_acts.length > 0
    getActs(goal_acts)
  if top_products.length > 0
    getProducts(top_products)
  if user_donates.length > 0
    getDonates(user_donates)


$(document).on "turbolinks:load", ->
  reloadChart()


  # line = new Chart(user_donates, {
  #   type: 'line'
  #   data:
  #     datasets: [{
  #       data: [10,20,30]
  #       label: "line 1"
  #       borderColor: ['red']
  #     },{
  #       data: [20,10,30]
  #       label: "line"
  #       borderColor: ['yellow']
  #     }]
  #     labels: ['jan', 'fev', "marc"]
  #   options: {}
  # })
