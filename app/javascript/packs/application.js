// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery-validation")

import Dropzone from 'dropzone'

Dropzone.autoDiscover = false

document.addEventListener("turbolinks:load", () => {
  $("#new_upload_form").validate({
    rules: {
      'upload_form[name]': {
        required: true
      },
      'upload_form[comment]': {
        required: function(element){
          return $("#upload_form_boat_id").val().length === 0;
        }
      }
    }
  });

  var myDropzone = new Dropzone("#file-upload", {
    addRemoveLinks: true,
    headers: {
    'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    },
    maxFilesize: (2 * 1024)
  });

  myDropzone.on("success", function (file, response) {
    var input = $("<input type='hidden' name='upload_form[files][]'></input>")
    input.val(response.id)

    $("#new_upload_form").append(input)
    $("#new_upload_form input[type='submit']").attr("disabled", false)
  });

  myDropzone.on("removedfile", function(file){
    if ($(".dz-preview").length === 0) {
      $("#new_upload_form input[type='submit']").attr("disabled", true)
    }
  })
})
