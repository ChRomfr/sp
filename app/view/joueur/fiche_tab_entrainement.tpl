{strip}

<!-- LIEN IMPRESSION -->
{if !isset($smarty.get.printer)}
<div class="fright">
	{if isset($smarty.get.type)}
		<a href="{$Helper->getLink("joueur/getEntrainementInfo/{$joueur_id}?printer&sportifinfo&sportif_id={$joueur_id}&type={$smarty.get.type}")}" title="Print" target="_blank"><i class="icon-print"></i></a>
	{else}
		<a href="{$Helper->getLink("joueur/getEntrainementInfo/{$joueur_id}?printer&sportifinfo&sportif_id={$joueur_id}")}" title="Print" target="_blank"><i class="icon-print"></i></a>
	{/if}
</div>
<div class="clear"></div>
{/if}

<div class="well">
	<table class="table table-bordered table-striped  table-condensed">
		<caption><h4>{$lang.Entrainements}</h4>
	    <thead>
	        <tr>
	            <th>{$lang.Date}</th>
	            <th>{$lang.Presence}</th>
	            <th>{$lang.Entrainement}</th>
	            <th>{$lang.Cycle}</th>
	        </tr>
	    </thead>
	    <tbody>
	    {foreach $Entrainements as $Row}
	        {if $Row.presence != ''}
	        <tr>
	            <td style="width:15%">{$Row.date_entrainement|date_format:$config.format_date_day}</td>
	            <td style="width:15%">{$Row.presence}</td>
	            <td style="width:50%"><a href="{getLink("entrainement/entrainementDetail/{$Row.entrainement_id}?joueur_id={$Row.joueur_id}&nohtml")}" title="" class="fbdetailentrainement">{$Row.description|nl2br}</a></td>
	            <td style="width:20%">{$Row.cycle}</td>
	        </tr>
	        {/if}
	    {/foreach}
	    </tbody>
	</table>
</div>

<!-- CYCLES -->
<div class="well">
	
	{if $smarty.const.USE_ENTRAINEMENT_CYCLE == TRUE && $smarty.session.acl.gest_entrainement == 1 && $smarty.session.acl.gest_joueur == 1}
	<div class="fright">
		{if !isset($smarty.get.printer)}
		<a href="{getLink("entrainement/addCycle/{$joueur_id}?nohtml")}" title="{$lang.Nouveau_cycle}" id="fbformaddcycle"><i class="icon-plus"></i></a>
		{/if}
	</div>
	{/if}
	
	<div style="clear:both"></div>

	<table class="table table-bordered table-striped  table-condensed">
		<caption><h4>{$lang.Cycles}</h4></caption>
		<thead>
			<tr>
				<th>{$lang.Date_debut}</th>
				<th>{$lang.Date_fin}</th>
				<th>{$lang.Cycle}</th>
				<th>{$lang.Nombre_entrainement}</th>
			</tr>        
		</thead>
		<tbody>
			{foreach $Cycles as $Row}
			<tr>
				<td>{$Row.date_debut|date_format:$config.format_date_day}</td>
				<td>{$Row.date_fin|date_format:$config.format_date_day}</td>
				<td><a href="{getLink("entrainement/cycleDetail/{$Row.id}?nohtml")}" title="" class="fbdetailcyle">{$Row.nom}</a></td>
				<td>{$Row.NbEntrainement}</td>
			</tr>
			{/foreach}
		</tbody>
	</table>
</div>
{/strip}

<script type="text/javascript">
<!--

$(document).ready(function() {
    $("a#fbformaddcycle").fancybox();
    $("a.fbdetailcyle").fancybox();
    $('a.fbdetailentrainement').fancybox();
});

//-->
</script>