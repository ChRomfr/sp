<script type="text/javascript">
<!--
{if $smarty.session.acl.gest_entrainement == true}
	function deleteExercice( exercice_id ){
		if( confirm('{$lang.Confirm_suppression_exercice} ?') ){
			window.location.href = '{getLink("test/deleteExercice/'+ exercice_id +'")}';
		}
	}
{/if}
//-->
</script>

{strip}
<ul class="breadcrumb">
	<li><a href="{getLink("index/index")}" title="">{$lang.Accueil}</a><span class="divider">/</span><li>
	<li><a href="{getLink("test/index")}" title="">{$lang.Test}</a><span class="divider">/</span><li>
	<li>{$lang.Exercices}</li>
</ul>

{if $smarty.session.acl.gest_entrainement == 1}
<div class="fright">
	<a href="{getLink("test/addExercice")}" title=""><i class="icon-plus"></i></a>
</div>
<div class="clear"></div>
{/if}

<div class="well">
	<h2>{$lang.Exercices}</h2>
	<table class="table table-bordered table-striped table-condensed">
		<thead>
			<tr>
				<th>{$lang.Exercice}</th>
				<th>{$lang.Unite}</th>
				<th>{$lang.Action}</th>
			</tr>
		</thead>
		<tbody>
			{foreach $Exercices as $Row}
			<tr>
				<td>{$Row.nom}</td>
				<td>{$Row.unite}</td>
				<td class="center">
					{if $smarty.session.acl.gest_entrainement == true}
					<a href="{getLink("test/editExercice/{$Row.id}")}" title=""><img src="{$config.url}{$config.url_dir}web/images/edit.png" alt="" /></a>
					<a href="javascript:deleteExercice({$Row.id})" title=""><img src="{$config.url}{$config.url_dir}web/images/delete.png" alt="" /></a>
					{/if}
				</td>
			</tr>
			{/foreach}
		</tbody>
	</table>
</div>
{/strip}