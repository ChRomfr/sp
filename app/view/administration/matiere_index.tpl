<script type="text/javascript">
<!--
$(function() {
    $( "#diag-adm-matiere" ).dialog({ autoOpen: false, width:600 });
});

function deleteMatiere(matiere_id){
	if( confirm('{$lang.Confirm_suppression_matiere} ?') ){
		window.location.href = '{getLink("administration/matiereDelete/'+ matiere_id +'")}';
	}
}

function getFormAdd(){
	$("#diag-adm-matiere").html("");
	$.get(
        '{getLink("administration/matiereAdd")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $("#diag-adm-matiere").html(data); }
    )
    {/literal}
    
     $( "#diag-adm-matiere" ).dialog('open');
}

function getFormEdit(matiere_id){
	$("#diag-adm-matiere").html("");
	$.get(
        '{getLink("administration/matiereEdit/'+matiere_id+'")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $("#diag-adm-matiere").html(data); }
    )
    {/literal}
    
     $( "#diag-adm-matiere" ).dialog('open');
}
//->
</script>

<div id="bread">
	<a href="{getLink("index/index")}" title="">{$lang.Accueil}</a>&nbsp;>>&nbsp;
	<a href="{getLink("administration/index")}" title="">{$lang.Administration}</a>&nbsp;>>&nbsp;
	{$lang.Matieres}
</div>

<div class="showData">
	<div class="fright">
		<a href="javascript:getFormAdd();" title=""><img src="{$config.url}{$config.url_dir}web/images/add.png" alt="" /></a>
	</div>	
	<h1>{$lang.Matieres}</h1>
	<div class="clear"></div>
	<table class="tadmin">
		<thead>
			<tr>
				<td>#</td>
				<td>{$lang.Matiere}</td>
				<td>{$lang.Action}</td>
			</tr>
		</thead>
		<tbody>
			{foreach $Matieres as $Row}
			<tr>
				<td>{$Row.id}</td>
				<td>{$Row.matiere}</td>
				<td  class="center"><a href="javascript:getFormEdit({$Row.id});" title=""><img src="{$config.url}{$config.url_dir}web/images/edit.png" alt="" /></a>&nbsp;&nbsp;<a href="javascript:deleteMatiere({$Row.id});" title=""><img src="{$config.url}{$config.url_dir}web/images/delete.png" alt="" /></a></td>
			</tr>
			{/foreach}
		</tbody>
	</table>
</div>
<div id="diag-adm-matiere"></div>