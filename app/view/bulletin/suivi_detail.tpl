<script>
<!--
{if $smarty.session.acl.gest_joueur == 1}
function getFormSuiviEdit(suivi_id){
    $('#contenu_diag').html('<div class="sep"></div><img src="{$config.url}{$config.url_dir}web/images/ajax-loader.gif" />');
    
    $.get(
        '{getLink("bulletin/suiviEdit/'+suivi_id+'")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#contenu_diag').html(data); }
    )
    {/literal}
}

function deleteSuivi(suivi_id){
	if( confirm('{$lang.Confirm_suppression_suivi} ?') ){
		window.location.href = '{getLink("bulletin/suiviDelete/'+ suivi_id +'")}';
	}	
}
{/if}
//-->
</script>
<div id="contenu_diag">
	<div class="showData">
		<div class="fright">
			{if $smarty.session.acl.gest_joueur == 1}
			<a href="javascript:getFormSuiviEdit({$Suivi.id})" title=""><img src="{$config.url}{$config.url_dir}web/images/edit.png" alt="" /></a>
			&nbsp;
			<a href="javascript:deleteSuivi({$Suivi.id})" title=""><img src="{$config.url}{$config.url_dir}web/images/delete.png" alt="" /></a>
			{/if}
		</div>
		<h1>{$lang.Suivi_du} {$Suivi.timestamp_suivi|date_format:$config.format_date_day}</h1>
		<div class="clear"></div>
		<table>
			<!-- Observation etablissement -->
			<tr>
				<td style="vertical-align:top">{$lang.Observation_etablissement} : </td>
				<td style="vertical-align:top">{$Suivi.observation_etablissement|nl2br}</td>
			</tr>
			<tr><td colspan="2">&nbsp;</td></tr>
			<!-- Observation structure -->
			<tr>
				<td style="vertical-align:top">{$lang.Observation_structure} : </td>
				<td  style="vertical-align:top">{$Suivi.observation_structure|nl2br}</td>
			</tr>
			<tr><td colspan="2">&nbsp;</td></tr>
			<!-- Remarque-->
			<tr>
				<td style="vertical-align:top">{$lang.Remarque} : </td>
				<td  style="vertical-align:top">{$Suivi.remarque|nl2br}</td>
			</tr>
		</table>
	</div>
</div>