

<!-- Bootstrap CSS -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet" />

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>

<!-- jQuery UI CSS -->
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	//Helper function to keep table row from collapsing when being sorted
	var fixHelperModified = function(e, tr) {
		var $originals = tr.children();
		var $helper = tr.clone();
		$helper.children().each(function(index)
		{
		  $(this).width($originals.eq(index).width())
		});
		return $helper;
	};

	//Make diagnosis table sortable
	$("#diagnosis_list tbody").sortable({
    	helper: fixHelperModified,
		stop: function(event,ui) {renumber_table('#diagnosis_list')}
	}).disableSelection();


	//Delete button in table rows
	$('table').on('click','.btn-delete',function() {
		tableID = '#' + $(this).closest('table').attr('id');
		r = confirm('Delete this item?');
		if(r) {
			$(this).closest('tr').remove();
			renumber_table(tableID);
			}
	});

});

//Renumber table rows
function renumber_table(tableID) {
	$(tableID + " tr").each(function() {
		count = $(this).parent().children().index($(this)) + 1;
		$(this).find('.priority').html(count);
	});
}


</script>

<style type="text/css">
.ui-sortable tr {
	cursor:pointer;
}
		
.ui-sortable tr:hover {
	background:rgba(244,251,17,0.45);
}

</style>


<div id="content">

<h1>Sortable table</h1>

            <table class="table" id="diagnosis_list">
                <thead>
                    <tr><th>Priority</th><th>Name</th><th>Favorite fruit</th><th>Vegetarian?</th><th>&nbsp;</th></tr>
                </thead>
                <tbody>
					<tr><td class='priority'>1</td><td>George Washington</td><td>Apple</td><td>N</td><td><a class='btn btn-delete btn-danger'>Delete</a></td></tr>
					<tr><td class='priority'>2</td><td>John Adams</td><td>Pear</td><td>Y</td><td><a class='btn btn-delete btn-danger'>Delete</a></td></tr>
					<tr><td class='priority'>3</td><td>Thomas Jefferson</td><td>Banana</td><td>Y</td><td><a class='btn btn-delete btn-danger'>Delete</a></td></tr>
					<tr><td class='priority'>4</td><td>Ben Franklin</td><td>Kumquat</td><td>N</td><td><a class='btn btn-delete btn-danger'>Delete</a></td></tr>
					<tr><td class='priority'>5</td><td>Alexander Hamilton</td><td>Red grapes</td><td>N</td><td><a class='btn btn-delete btn-danger'>Delete</a></td></tr>
                </tbody>
            </table>

</div>

