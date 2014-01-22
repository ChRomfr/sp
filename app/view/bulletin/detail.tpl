<script type="text/javascript">
<!--
function deleteBulletin(){
    if( confirm('{$lang.Confirm_suppression_bulletin} ?') ){
        window.location.href = '{getLink("bulletin/delete/{$Trimestre.id}")}';
    }
}
//->
</script>
<div class="showData">
	<div class="fright">
		{if $smarty.session.acl.gest_joueur == true}<a href="{getLink("bulletin/edit/{$Trimestre.id}")}" title="{$lang.Edition}" class="infos"><img src="{$config.url}{$config.url_dir}web/images/edit.png" alt="" /></a>{/if}
		{if $smarty.session.acl.gest_joueur == true}<a href="javascript:deleteBulletin();" title="{$lang.Supprimer}" class="infos"><img src="{$config.url}{$config.url_dir}web/images/delete.png" alt="" /></a>{/if}
	</div>
	<div style="clear:both;"></div>
	<h1>{$lang.Trimestre} : {$Trimestre.num} {$Trimestre.annee}</h1>
	{if count($Notes) > 0}
	<table class="tadmin">
		<thead>
			<tr>
				<td>{$lang.Matiere}</td>
				<td>{$lang.Moyenne}</td>
				<td>{$lang.Observation}</td>
			</tr>
		</thead>
		<tbody>
		{foreach $Notes as $Row}
		<tr>
			<td>{$Row.matiere}</td>
			<td class="center">{$Row.moyenne}</td>
			<td class="center">{$Row.observation|nl2br}</td>
		</tr>
		{/foreach}
		</tbody>
	</table>	
	<br/>
	{/if}
	
	<table style="width:95%;">
		{if $Trimestre.observation_structure != ''}
		<tr>
			<td>{$lang.Observation_structure} :</td>
			<td>{$Trimestre.observation_structure|nl2br}</td>
		</tr>
		{/if}
		
		{if $Trimestre.observation_etablissement != ''}
		<tr>
			<td>{$lang.Observation_etablissement} :</td>
			<td>{$Trimestre.observation_etablissement|nl2br}</td>
		</tr>
		{/if}
	</table>
</div>