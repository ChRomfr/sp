{if $smarty.const.BREAD == true}
<div id="bread">
    <a href="{getLink("index/index")}" title="">{$lang.Accueil}</a>&nbsp;-&gt;&nbsp;
    <a href="{getLink("joueur/index")}" title="">{$lang.Joueur}</a>&nbsp;-&gt;&nbsp;
    <a href="{getLink("joueur/fiche/{$Joueur.id}")}" title="">{$Joueur.nom} {$Joueur.prenom}</a>&nbsp;-&gt;&nbsp;
    {$lang.Nouveau_bulletin}
</div>
{/if}

<br/>
<form method="post" class="form">
<h1>{$lang.Trimestre} {$Trimestre.num} {$Trimestre.annee}</h1>
<table class="tadmin">
    <thead>
        <tr>
            <td>{$lang.Matiere}</td>
            <td>{$lang.Moyenne}</td>
            <td>{$lang.Observation}</td>
        </tr>
    </thead>
    <tbody>
    {foreach $Matieres as $Row}
    <tr>
        <td>
            {$Row.matiere}
            <input type="hidden" name="matieres[{$Row.id}][matiere_id]" value="{$Row.id}"/>
        </td>
        <td class="center">
            <input type="text" name="matieres[{$Row.id}][moyenne]" value=""/>
        </td>
        <td class="center">
            <textarea name="matieres[{$Row.id}][observation]" cols="40"></textarea>
        </td>
    </tr>
    {/foreach}
	
    </tbody>
</table>
<!-- OBSERVATION SAISIE -->
<dl>
	<dt><label for="observation_etablissement">{$lang.Observation_etablissement} :</label></dt>
	<dd><textarea name="trimestre[observation_etablissement]" id="observation_etablissement" rows="4" cols="40"></textarea></dd>
</dl>
<dl>
	<dt><label for="observation_structure">{$lang.Observation_structure} :</label></dt>
	<dd><textarea name="trimestre[observation_structure]" id="observation_structure" rows="4" cols="40"></textarea></dd>
</dl>
<br/>
<div class="form_submit center">
    <input type="hidden" name="matieres[joueur_id]" value="{$Joueur.id}" />
    <input type="hidden" name="matieres[trimestre_id]" value="{$Trimestre.id}" />
	<input type="hidden" name="trimestre[id]" value="{$Trimestre.id}" />
    <input type="submit" value="{$lang.Enregistrer}" />
</div>
</form>