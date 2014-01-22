{if $smarty.session.acl.gest_entrainement == 1}

<script type="text/javascript">
<!--
function deleteEntrainement(eid){
	if( confirm('{$lang.Confirm_suppression_entrainement} ?') ){
		window.location.href =  '{getLink("entrainement/delete/'+ eid +'?token={$smarty.session.token}")}'
	}
}
//-->
</script>
{strip}

{if $smarty.const.BREAD == 1}
<ul class="breadcrumb">
	<li><a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a><span class="divider">/</span></li>
	<li>{$lang.Entrainement}</li>
</ul>
{/if}

<div class="well">

	<h1>{$lang.Entrainement}</h1>

	<table class="table table-bordered table-striped">
		<thead>
			<tr>
				<th><a href="{getLink("entrainement/index")}" title="">{$lang.Date}</a></th>
				<th><a href="{getLink("entrainement/index?order=entraintement")}" title="">{$lang.Entrainement}</a></th>
				{if $config.entrainement_type == 1 && $InfosInstall.i_type == 'full'}<th><a href="{getLink("entrainement/index?order=type")}" title="" >{$lang.Type}</a></th>{/if}
				<th>{$lang.Action}</th>
			</tr>
		</thead>
		<tbody>
		{foreach $Entrainements as $Row}
			<tr>
				<td>{$Row.date_entrainement|date_format:$config.format_date_day}</td>
				<td>{$Row.description|nl2br}</td>
				{if $config.entrainement_type == 1 && $InfosInstall.i_type == 'full'}<td>{$Row.entrainement_type}</td>{/if}
				<td class="center">
					<a href="{getLink("entrainement/edit/{$Row.id}")}" title=""><i class="icon-pencil"></i></a>
					<a href="javascript:deleteEntrainement({$Row.id})" title=""><i class="icon-trash"></i></a>
				</td>
			</tr>
		{/foreach}
		</tbody>
	</table>

</div>
{/if}