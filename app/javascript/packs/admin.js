import 'bootstrap'
import 'admin-lte'
import '../stylesheets/admin'

require("@rails/ujs").start()
require("trix")
require("@rails/actiontext")

$(document).ready(function() {
  $("#job_indices_grid_date").on("change", ()=>{
    $("form.job_indices_grid").submit()
  })
})
