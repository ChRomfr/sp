<script type="text/javascript">
<!--
$(function() {
    $('a.fbdetailseance').fancybox();
});

function deleteSeance(sid){
	if( confirm('{$lang.Confirm_suppression_seance} ?') ){
		$.get(
				'{getLink("muscu/deleteSeanceById/'+ sid +'")}',{literal}
				{nohtml:'nohtml'},
				function(data){}
			)
		{/literal}

		$("tr#"+sid).remove();
	}
}
-->
</script>
{strip}
<!-- CYCLE START -->
<div class="well">

	<table class="table table-bordered table-striped table-condensed">
		<caption><h4>{$lang.Cycles}</h4></caption>

		<thead>
			<tr>
				<th>#</th>
				<th>{$lang.Cycle}</th>
				<th>{$lang.Date_debut}</th>
				<th>{$lang.Date_fin}</th>
			</tr>
		</thead>

		<tbody>
			{foreach $Cycles as $Data}
			<tr>
				<td>{$Data.id}</td>
				<td>{$Data.nom}</td>
				<td>{$Data.date_debut|date_format:$config.format_date_day}</td>
				<td>{$Data.date_fin|date_format:$config.format_date_day}</td>
			</tr>
			{/foreach}
		</tbody>
	</table>

</div>
<!-- CYCLE END -->

<!-- SEANCES START -->
{if $smarty.session.acl.gest_muscu == true}
<div class="fright">
	<a href="{getLink("muscu/addSeanceByJoueurId/{$joueur_id}")}" title=""><img src="{$config.url}{$config.url_dir}web/images/add.png" alt="" /></a>
</div>
{/if}

{* AFFICHAGE DES SEANCES *}
<div class="well">
	<div style="clear:both;"></div>
	<table class="table table-bordered table-striped table-condensed">
		<caption><h4>{$lang.Seances}</h4></caption>
		<thead>
			<tr>
				<th>#</th>
				<th>{$lang.Date}</th>
				<th>{$lang.Cycle}</th>
				{if $smarty.session.acl.gest_muscu == true}
				<th></th>
				{/if}
			</tr>
		</thead>
		<tbody>
			{foreach $Seances as $Row}
			<tr id="s_{$Row.id}">
				<td><a href="{getLink("muscu/getExerciceBySeanceId/{$Row.id}?nohtml")}" title="" class="fbdetailseance">{$Row.id}</a></td>
				<td>{$Row.date_seance|date_format:$config.format_date_day}</td>
				<td>{$Row.cycle}</td>
				{if $smarty.session.acl.gest_muscu == true}
				<td class="center"><a href="javascript:deleteSeance('s_{$Row.id}')"><img src="{$config.url}{$config.url_dir}web/images/delete.png" alt=""/></a></td>
				{/if}
			</tr>
			{/foreach}
		</tbody>
	</table>
</div>
<!-- SEANCES END -->
{/strip}
{literal}
<script>
    $(document).ready(function() 
    { 
        $("#tableau_test").tablesorter({
            dateFormat: "uk",
            headers: {0: {sorter: "shortDate"}},
            sortList: [[0,1]]
        }); 
    } 
);
 
</script>{/literal}

<div class="well">
	<h1>{$lang.Tests}</h1>
	{* Affichage des Tests *}
	{$HTML_TABLE}
	<div class="fright">
		<a href="javascript:showid('graph_conteneur');" title=""><img src="{$config.url}{$config.url_dir}web/images/graph.png" style="height:24px;" /></a>
	</div>
	<div class="clear"></div>
	
	{* AFFICHAGE DES GRAPHS *}
	<div id="graph_conteneur" style="display:none;">
	{foreach $Exercices as $Row}
		<div><img src="{getLink("muscu/graph?nohtml&joueur={$joueur_id}&exercice={$Row.exercice_id}")}" alt="" /></div>
	{/foreach}
	</div>	
</div>