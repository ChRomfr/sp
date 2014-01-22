<!-- widget/actualite_detail.tpl -->
{strip}
<div class="well">
	<h4>{$Actu.titre}</h4>
	<div>{$Actu.contenu|nl2br}</div>
	<hr/>
	<div>Le <strong>{$Actu.creat_on|date_format:$config.format_date_day}</strong> par <strong>{$Actu.auteur}</strong></div>
</div>
{/strip}