$(document).ready(function() {
  var base_url = window.location.protocol + "//" + window.location.host + "/";
  $('#user-datatable').DataTable( {
    "createdRow": function (row, data, index) {
      if(data["status"] ===  "active"){
        $('td', row).eq(4).css('color', 'green');
      } else {
        $('td', row).eq(4).css('color', 'red');
      }
    },
    processing: true,
    serverSide: true,
    ajax: base_url,
    order: [[ 5, "desc" ], [ 0, "asc" ],[ 1, "asc" ],[ 3, "asc" ],[ 2, "asc" ], [ 4, "asc" ]],
    columns: [
      { data: "name"},
      { data: "email" },
      { data: "phone" },
      { data: "title" },
      { data: "status" },
      { data: "updated_at" },
      {
        data: null,
        render: function (data, type, row) {
          return '<a href="" id="' + row.id + '" class="remove_user">Delete</a> / <a href="" id="' + row.id + '" class="edit_user">Edit</a>'
        }
      }
    ]
  });

  $('#user-datatable').on('click', 'a.remove_user', function (e) {
    e.preventDefault();
    $.ajax({
      type: "DELETE",
      url: `${base_url}users/${e.currentTarget.id}` ,
     });
  });

  $('#user-datatable').on('click', 'a.edit_user', function (e) {
    e.preventDefault();
    $.ajax({
      type: "GET",
      url: `${base_url}users/${e.currentTarget.id}/edit` ,
     });
  });
});
