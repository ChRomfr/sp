{strip}

<div id="bread">
	<a href="{getLink('index/index')}" title="">{$lang.Accueil}</a>&nbsp;>>&nbsp;
	{$lang.Equipes}
</div>

<div class="showData">
	
	<h1>{$lang.Equipes}</h1>
	
	<table class="tadmin">
		<thead>
			<tr>
				<td>{$lang.Equipe}</td>
			</tr>
		</thead>
		<tbody>
			{foreach $Equipes as $Row}
			<tr>
				<td>{$Row.e_nom}</td>
			</tr>
			{/foreach}
		</tbody>
	</table>

</div>
{/strip}