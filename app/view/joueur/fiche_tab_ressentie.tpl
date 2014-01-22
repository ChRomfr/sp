<script>
<!--
$(function() {
    $( "#diag-ressentie" ).dialog({ autoOpen: false, width:700 });
});

{if $smarty.session.utilisateur.type == 'joueur'}
function getFormRessentie(){
	$('#diag-ressentie').html("");
	$.get(
        '{getLink("joueur/sequenceAdd")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#diag-ressentie').html(data); }
    )
    {/literal}
	
	$( "#diag-ressentie" ).dialog('open');
}
{/if}

{if $smarty.session.acl.gest_entrainement == 1 || $smarty.session.acl.gest_joueur == 1}
function getFormEntraineur(sequence_id){
	$('#diag-ressentie').html("");
	$.get(
        '{getLink("joueur/sequenceEntraineurAdd/'+sequence_id+'")}',{literal}
        {nohtml:'nohtml'},
        function(data){ $('#diag-ressentie').html(data); }
    )
    {/literal}
	
	$( "#diag-ressentie" ).dialog('open');
}
{/if}

function getContenu(joueur, semaine, annee){
	$('#contenu_ressentie').html('<div class="center"><img src="{$config.url}{$config.url_dir}web/images/lightbox-ico-loading.gif" alt="" /></div>');
	
	$.get(
        '{getLink("ressentie/ajaxGetTableauRessentie")}',{literal}
        {nohtml:'nohtml', joueur:joueur, semaine:semaine, year:annee},
        function(data){ $('#contenu_ressentie').html(data); }
    )
    {/literal}
}
//-->
</script>{strip}
<div class="showData" id="tab_projet">
	<div class="fright">
		{if $smarty.session.utilisateur.type == 'joueur'}
		<a href="javascript:getFormRessentie()"><img src="{$config.url}{$config.url_dir}web/images/add.png" alt="" /></a>
		{/if}
	</div>
	<div id="contenu_ressentie">
		<h1>{$lang.Ressentie} - {$lang.Semaine} {$Semaine} {$Year}</h1>
		<div class="clear"></div>
	
		<div class="fleft">
			<a href="javascript:getContenu({$Previous})" title=""><<</a>
		</div>
		<div class="fright">
			<a href="javascript:getContenu({$Next})" title="">>></a>
		</div>
		<div class="clear"></div>
		<table style="width:100%">		
				<tr>
					<td style="width:10%;"></td>
					{foreach $Sequences as $Row}
					<td class="table_titre_profor">
						S {$Row.numero}
						{if $smarty.session.acl.gest_entrainement == 1 || $smarty.session.acl.gest_joueur == 1}
							<div class="fright">
								<a href="javascript:getFormEntraineur({$Row.id});" title=""><img src="{$config.url}{$config.url_dir}web/images/add.png" alt="" /></a>
							</div>
						{/if}
					</td>
					{/foreach}
					<td class="table_titre_profor">{$lang.Total}</td>
				</tr>	
					
				<tr>
					<td class="table_titre_profor">{$lang.Date}</td>
					{foreach $Sequences as $Row}
					<td>{$Row.date_s}</td>
					{/foreach}
					<td></td>
				</tr>
				<tr>
					<td class="table_titre_profor">{$lang.Fatigue}</td>
					{foreach $Sequences as $Row}
					<td>{$Row.fatigue}</td>
					{/foreach}
					<td>{$Stats.fatigue} / {$Stats.global}</td>
				</tr>
				
				<tr>
					<td class="table_titre_profor">{$lang.Intensite_entrainement}</td>
					{foreach $Sequences as $Row}
					<td>{$Row.ressentie_entrainement}</td>
					{/foreach}
					<td>{$Stats.ressentie_entrainement} / {$Stats.global}</td>
				</tr>	
				
				<tr>
					<td class="table_titre_profor">{$lang.Ressentie_entraineur}</td>
					{foreach $Sequences as $Row}
					<td>{$Row.ressentie_entraineur}</td>
					{/foreach}
					<td>{$Stats.ressentie_entraineur} / {$Stats.global}</td>
				</tr>	
		</table>
		<br/>
		<table style="margin:auto;">
		<thead>
			<tr>
				<td>Fatigue</td>
				<td>Entrainement</td>
				<td>Entraineur</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="center"><img src="{getLink("ressentie/getGraphique?nohtml&semaine={$Semaine}&sportif={$Joueur_id}&year={$Year}&type=fatigue")}" alt="" /></td>
				<td class="center"><img src="{getLink("ressentie/getGraphique?nohtml&semaine={$Semaine}&sportif={$Joueur_id}&year={$Year}&type=entrainement")}" alt="" /></td>
				<td class="center"><img src="{getLink("ressentie/getGraphique?nohtml&semaine={$Semaine}&sportif={$Joueur_id}&year={$Year}&type=entraineur")}" alt="" /></td>
			</tr>
		</tbody>
	</table>
	</div>
	<h1>Annuel</h1>
	<table style="margin:auto;">
		<thead>
			<tr>
				<td>Fatigue</td>
				<td>Entrainement</td>
				<td>Entraineur</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="center"><img src="{getLink("ressentie/graphAnnuel?nohtml&year={$YearForGraphAnnuel}&sportif={$Joueur_id}&type=fatigue")}" alt="" /></td>
				<td class="center"><img src="{getLink("ressentie/graphAnnuel?nohtml&year={$YearForGraphAnnuel}&sportif={$Joueur_id}&type=entrainement")}" alt="" /></td>
				<td class="center"><img src="{getLink("ressentie/graphAnnuel?nohtml&year={$YearForGraphAnnuel}&sportif={$Joueur_id}&type=entraineur")}" alt="" /></td>
			</tr>
		</tbody>
	</table>
	
</div>
<div id="diag-ressentie"></div>{/strip}