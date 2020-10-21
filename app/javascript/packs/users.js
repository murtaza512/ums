$(document).ready(function() {
  $('#user-datatable').DataTable( {
    "processing": true,
    "serverSide": true,
    "bSort": true,
    "ajax": window.location.protocol + "//" + window.location.host + "/",
    "order": [[ 5, "desc" ], [ 0, "asc" ],[ 1, "asc" ],[ 3, "asc" ],[ 2, "asc" ], [ 4, "asc" ]],
  });
});
