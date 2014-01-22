<div class="well">
{if isset($smarty.get.joueur_id)}

<table class="table table-stripped">
	<tr>
		<td>{$lang.Date} :</td>
		<td>{$Entrainement.date_entrainement|date_format:$config.format_date_day}</td>
	</tr>
	<tr>
		<td>{$lang.Entrainement} :</td>
		<td>{$Entrainement.description|nl2br}</td>
	</tr>
	<tr>
		<td>{$lang.Presence} :</td>
		<td>{$Entrainement.presence}</td>
	</tr>
	<tr>
		<td>{$lang.Suivi} :</td>
		<td>{$Entrainement.suivi|nl2br}</td>
	</tr>
	{if !empty($Entrainement.cycle)}
	<tr>
		<td>{$lang.Cycle} :</td>
		<td>{$Entrainement.cycle}</td>
	</tr>
	{/if}
</table>
{else}

{/if}
</div>