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
  $.validator.addMethod('filesize', function (value, element, param) {
    return this.optional(element) || (element.files[0].size <= param)
  }, 'File size must be less than 2GB');

  $("#new_upload_form").validate({
    rules: {
      'upload_form[name]': {
        required: true
      },
      'upload_form[files][]': {
        required: true,
        filesize: (2 * 1024 * 1024 * 1024)
      },
      'upload_form[comment]': {
        required: (element) => {
          return $("#upload_form_boat_id").val().length === 0;
        }
      }
    },
    submitHandler: (form) => {
      let data = new FormData(form)
      data.append("files", $(form).find("input[type='file']").files)
      $("#progress-bar").show()
      $("#suggess-message").hide()
      $(form).find("input[type='submit']").attr("disabled", true)

      $.ajax({
        xhr: () => {
          var xhr = new window.XMLHttpRequest()

          xhr.upload.addEventListener("progress", (evt) => {
            if (evt.lengthComputable) {
              let percentComplete = evt.loaded / evt.total;
              percentComplete = parseInt(percentComplete * 100);
              console.log(percentComplete);

              $("#progress-bar .loading-bar").css("width", `${percentComplete}%`)
            }
          }, false);

          return xhr;
        },
        type: "POST",
        url: "/upload",
        contentType: false,
        processData: false,
        data: data,
        success: () =>{
          $(form)[0].reset()
          $(form).find("input[type='submit']").attr("disabled", false)
          $("#progress-bar").hide()
          $("#suggess-message").show()
          $("#progress-bar .loading-bar").css("width", `${0}%`)
        }
      });
    }
  });
})
