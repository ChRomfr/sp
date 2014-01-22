<div class="well">
	<h1>{$lang.Joueurs}</h1>
	<table class="table">
		<tr>
			{foreach $Joueurs as $Joueur name=foo}
			<td class="center">
				<a href="{getLink("joueur/fiche/{$Joueur.id}")}" title="">
				{if isset($Joueur.photo_id)}
					<img src="{$config.url}{$config.url_dir}web/upload/joueurs/{$Joueur.id}/photo_id/{$Joueur.photo_id}" style="width:100px;" /><br/>{$Joueur.nom} {$Joueur.prenom}
				{else}
					<img src="{$config.url}{$config.url_dir}web/images/avatar/no_image.jpg" style="width:100px;" /><br/>{$Joueur.nom} {$Joueur.prenom}
				{/if}
				</a>
			</td>
			{if $smarty.foreach.foo.iteration % 5 == 0}</tr><tr>{/if}
			{/foreach}
		</tr>
	</table>
</div>