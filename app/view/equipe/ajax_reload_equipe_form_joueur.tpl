{strip}
<!-- RECHARGEMENT DES EQUIPES -->
<dl>
	<dt><label for="equipe_id">{$lang.Equipe} :</label></dt>
	<dd>
		<select name="equipe[equipe_id]" id="equipe_id">
			<option value="0"></option>
			{foreach $Equipes as $Row}
			<option value="{$Row.id}">{if !empty($Row.structure)}{$Row.structure}&nbsp;-&nbsp;{/if}{$Row.nom}</option>
			{/foreach}
		</select>
	</dd>
</dl>
{/strip}