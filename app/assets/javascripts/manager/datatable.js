function initDataTableTheater(){
  $("#theater").DataTable({
   destroy: true,
   order: []
  });
}

$(document).ready(function() {
  $("#theater").DataTable();
  initDataTableTheater();
});
