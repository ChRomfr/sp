<script type="text/javascript">
<!--
    function deleteSeance(SID){
        if( confirm('{$lang.Confirm_suppression_seance} ?') ){
            window.location.href = '{getLink("muscu/seanceDelete/'+SID+'")}';
        }
    } 
//-->
</script>

{if $smarty.const.BREAD}
<div id="bread">
	<a href="{getLink("index/index")}" title="{$lang.Accueil}">{$lang.Accueil}</a>&nbsp;>>&nbsp;
	<a href="{getLink("musculation/index")}" title="{$lang.Musculation}">{$lang.Musculation}</a>&nbsp;>>&nbsp;
	{$lang.Liste_des_seances}
</div>
{/if}

<div class="showData">
	{if $smarty.session.acl.gest_muscu == 1}
	<div class="fright">
		<a href="{getLink("muscu/seanceAdd")}" title=""><img src="{$config.url}{$config.url_dir}web/images/add.png" alt="" /></a>
	</div>
	{/if}
	<h1>{$lang.Liste_des_seances}</h1>
	<div class="clear"></div>
	<table class="tadmin">
		<thead>
			<tr>
				<td>#</td>
				<td>{$lang.Seance}</td>
				<td></td>
			</tr>
		</thead>
		<tbody>
			{foreach $Seances as $Seance}
			<tr>
				<td>{$Seance.id}</td>
				<td>{$Seance.nom}</td>
				<td class="center">
					{if $smarty.session.acl.gest_muscu == 1}
					<a href="javascript:deleteSeance({$Seance.id})" title=""><img src="{$config.url}{$config.url_dir}web/images/delete.png" /></a>
					{/if}
				</td>
			</tr>
			{/foreach}
		</tbody>
	</table>
</div>