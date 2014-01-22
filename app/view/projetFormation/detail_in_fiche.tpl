<!-- projetFormation/detail_in_fiche.tpl -->
{strip}
<div class="well">
	
	<div class="pull-right">
		{if $smarty.session.acl.gest_joueur == 1}
		<a href="{getLink("projetFormation/edit/{$Projet.id}")}" title=""><i class="icon-pencil"></i></a>
		<a href="javascript:deleteProjet()" title=""><i class="icon-trash"></i></a>
		{/if}
	</div>

	<table class="table">
		<caption>{$Projet.intitule}</caption>
	
		<tr>
			<td><label>{$lang.Annee} :</label></td>
			<td>{$Projet.year}</td>
		</tr>
	
		<tr>
			<td><label>{$lang.Terme} :</label></td>
			<td>
				{if $Projet.terme == 1}{$lang.Court}
				{elseif $Projet.terme == 2}{$lang.Moyen}
				{elseif $Projet.terme == 3}{$lang.Long}
				{/if}
			</td>	
		</tr>
	
		<tr>
			<td><label>{$lang.Observations} :</label></td>
			<td>{$Projet.observation|nl2br}</td>
		</tr>
		
		<tr>
			<td><label>{$lang.Projection_cycle} :</label></td>
			<td>{$Projet.projection_cycle|nl2br}</td>
		</tr>
	</table>
</div>
{/strip}
{if $smarty.session.acl.gest_joueur == 1}
<script>
function deleteProjet(){
	if( confirm('{$lang.Confirm_suppression_projet} ?') ){
		window.location.href = '{getLink("projetFormation/delete/{$Projet.id}")}';
	}
}
</script>
{/if}