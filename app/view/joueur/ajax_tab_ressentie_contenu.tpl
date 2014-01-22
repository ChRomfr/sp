{strip}<h1>{$lang.Ressentie} - {$lang.Semaine} {$Semaine} {$Year}</h1>
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
		<td class="table_titre_profor">{$lang.Ressentie_entrainement}</td>
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
</table>{/strip}