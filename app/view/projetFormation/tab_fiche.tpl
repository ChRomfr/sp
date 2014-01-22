<!-- projetFormation/tab_fiche.tpl -->
{strip}
<div class="well">

	<div class="pull-right">
		{if $smarty.session.acl.gest_joueur == 1}
		<a href="{getLink("projetFormation/add/{$Joueur_id}")}" title=""><i class="icon-plus"></i></a>
		{/if}
	</div>

	<h4>{$lang.Projet_formation}</h4>
	<div class="clearfix"></div>
	
	<table class="table table-bordered table-striped">
		<tr>
			<th></th>
			<th>{$lang.Premiere_annee}</th>
			<th>{$lang.Deuxieme_annee}</th>
			<th>{$lang.Troisieme_annee}</th>
		</tr>		

		{* LISTES A COURT TERME *}
		<tr>
			<th>{$lang.Court_terme}</th>
			<td>
				{if !empty($Projets.0)}
				<a href="{getLink("projetFormation/detailInFiche/{$Projets.0.id}?nohtml")}" title="" class="fbdetailpf">{$Projets.0.intitule}</a>
				{/if}
			</td>
			<td>
				{if !empty($Projets.1)}
				<a href="{getLink("projetFormation/detailInFiche/{$Projets.1.id}?nohtml")}" title="" class="fbdetailpf">{$Projets.1.intitule}</a>
				{/if}
			</td>
			<td>
				{if !empty($Projets.2)}
				<a href="{getLink("projetFormation/detailInFiche/{$Projets.2.id}?nohtml")}" title="" class="fbdetailpf">{$Projets.2.intitule}</a>
				{/if}
			</td>
		</tr>
		
		{* LISTES A MOYEN TERME *}
		<tr>
			<th>{$lang.Moyen_terme}</th>
			<td>
				{if !empty($Projets.3)}
				<a href="{getLink("projetFormation/detailInFiche/{$Projets.3.id}?nohtml")}" title="" class="fbdetailpf">{$Projets.3.intitule}</a>
				{/if}
			</td>
			<td>
				{if !empty($Projets.4)}
				<a href="{getLink("projetFormation/detailInFiche/{$Projets.4.id}?nohtml")}" title="" class="fbdetailpf">$Projets.4.intitule}</a>
				{/if}
			</td>
			<td>
				{if !empty($Projets.5)}
				<a href="{getLink("projetFormation/detailInFiche/{$Projets.5.id}?nohtml")}" title="" class="fbdetailpf">{$Projets.5.intitule}</a>
				{/if}
			</td>
		</tr>
		
		{* LISTES A LONG TERME *}
		<tr>
			<th>{$lang.Long_terme}</th>
			<td>
				{if !empty($Projets.6)}
				<a href="{getLink("projetFormation/detailInFiche/{$Projets.6.id}?nohtml")}" title="" class="fbdetailpf">{$Projets.6.intitule}</a>
				{/if}
			</td>
			<td>
				{if !empty($Projets.7)}
				<a href="{getLink("projetFormation/detailInFiche/{$Projets.7.id}?nohtml")}" title="" class="fbdetailpf">{$Projets.7.intitule}</a>
				{/if}
			</td>
			<td>
				{if !empty($Projets.8)}
				<a href="{getLink("projetFormation/detailInFiche/{$Projets.8.id}?nohtml")}" title="" class="fbdetailpf">{$Projets.8.intitule}</a>
				{/if}
			</td>
		</tr>
		
	</table>
</div>
{/strip}
<script>
<!--
$(function() {
    $('a.fbdetailpf').fancybox();
});
//-->
</script>