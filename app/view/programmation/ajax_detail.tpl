<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h4 id="">{$Prog.date_prog}</h4>
  </div>
  <div class="modal-body">

	<div class="well">
		{if $smarty.session.acl.gest_programmation == 1}
		<div class="pull-right">
			<a href="javascript:getFormEdit();" title="{$lang.Edition}"><i class="icon icon-pencil"></i></a>
			<a href="javascript:deleteThisProg();" title="{$lang.Supprimer}"><i class="icon icon-trash"></i></a>
		</div>
		{/if}
		<div class="clearfix"></div>

		<ul class="unstyled">
			<li>{$lang.Type} : {$Prog.nom}</li>
			<li>{$lang.Description} : {$Prog.description|nl2br}</li>
		</ul>
	</div>
</div>
<script type="text/javascript">
<!--
{if $smarty.session.acl.gest_programmation == 1}
function deleteThisProg(){
	if( confirm('{$lang.Confirm_suppression_prog} ?') ){
		window.location.href = '{getLink("programmation/delete/{$Prog.id}")}';
	}
}

function getFormEdit(){
	$('#diag-programmation').html(""); 
	$.get(
		'{getLink("programmation/edit/{$Prog.id}")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#diag-programmation').html(data); }
    )
    {/literal}
	
	$("#diag-programmation").dialog('open');
}

{/if}
//-->
</script>