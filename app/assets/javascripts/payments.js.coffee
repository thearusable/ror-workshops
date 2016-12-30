addDataTables = ->
  if ! $.fn.dataTable.isDataTable('.payments')
    $('.payments').dataTable({ "order": [[ 0, "asc" ]] })

$(document).ready addDataTables
$(document).on 'page:change', addDataTables
