// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require serviceworker-companion
// require select2
// require select2_locale_pt-BR
//= require Chart.min
//= require moment
//= require moment/pt-br.js

function order_by_occurrence(arr) {
  var counts = {};
  arr.forEach(function(value){
      if(!counts[value]) {
          counts[value] = 0;
      }
      counts[value]++;
  });

  return Object.keys(counts).sort(function(curKey,nextKey) {
      return counts[curKey] < counts[nextKey];
  });
}

function load_quagga(){
  container = $('#barcode-scanner');
  if (container.length > 0 && navigator.mediaDevices && typeof navigator.mediaDevices.getUserMedia === 'function') {

    var last_result = [];
    if (Quagga.initialized == undefined) {
      Quagga.onDetected(function(result) {
        var last_code = result.codeResult.code;
        last_result.push(last_code);
        if (last_result.length > 20) {
          code = order_by_occurrence(last_result)[0];
          last_result = [];
          Quagga.stop();
          $("#barcode").val(code)
          searchProduct(code)
          container.hide()
        }
      });
    }

    Quagga.init({
      inputStream : {
        name : "Live",
        type : "LiveStream",
        numOfWorkers: navigator.hardwareConcurrency,
        target: document.querySelector('#barcode-scanner')  
      },
      decoder: {
          readers : ['ean_reader','ean_8_reader','code_39_reader','code_39_vin_reader','codabar_reader','upc_reader','upc_e_reader']
      }
    },function(err) {
        if (err) { console.log(err); return }
        Quagga.initialized = true;
        Quagga.start();
    });

  }
};
// $(document).on('turbolinks:load', load_quagga);

$(function() {
  function decode(src) {
    var self = this, config = $.extend({}, self.state, {src: src});
    Quagga.decodeSingle(config, function(result) {
    });
  }
  Quagga.onDetected(function (data) {
    console.log("detected")
    console.log(data)
  })
  $(document).on("change", "#camera", function (e) {
    if (e.target.files && e.target.files.length) {
      decode(URL.createObjectURL(e.target.files[0]));
    }
  })
})