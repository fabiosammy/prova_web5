
function tableCreate(el, data)
{
    var tbl  = document.createElement("table");
    tbl.style.width  = "70%";
    tbl.className = "ui celled table";


    for (var i = 0; i < data.length; ++i)
    {
        var tr = tbl.insertRow();
        for(var j = 0; j < data[i].length; ++j)
        {
            var td = tr.insertCell();
            td.appendChild(document.createTextNode(data[i][j].toString()));
        }
    }
    el.appendChild(tbl);
}
function loadPhones(){
  var url = $(location).attr('href');

  $.get(url + "/phones.json", null, "json")
  .done(function(data) {
      rows = [];

      for (var i = 0; i < data.length; ++i)
      {
          cells = [];
          cells.push(data[i]["number"]);
          cells.push(data[i]["default"]);
          rows.push(cells);
      }
      tableCreate($("#results")[0], rows);
  });
}
