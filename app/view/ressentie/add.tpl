{if $smarty.const.BREAD == true}
<div id="bread">
    <a href="{getLink("index/index")}" title="">{$lang.Accueil}</a>&nbsp;>>&nbsp;
    <a href="{getLink("ressentie")}" title="">{$lang.Ressentie}</a>&nbsp;>>&nbsp;
    {$lang.Nouveau}
</div>
{/if}

<form class="form" method="post" action="">
    <h1>{$lang.Ressentie} {$lang.Semaine} {$semaine} {$year} - {$Lundi} {$lang.Au} {$Dimanche}</h1>
    <table class="tadmin">
        <thead>
            <tr>
                <td>{$lang.Sportif}</td>
                {for $it=1 to $MaxSequence}
                <td>S {$it}</td>
                {/for}
            </tr>
        </thead>
        <tbody>
            {foreach $Sportifs as $Row name=foo}
            <tr>
                <td>
                    {$Row.prenom} {$Row.nom}
                    <input type="hidden" name="notes[{$smarty.foreach.foo.index}][sportif_id]" value="{$Row.sportif_id}"  />
                </td>
                {* BOUCLE SUR LES SEQUENCES *}
                {foreach $Row.sequences as $sequence name=its}
                <td class="center">
                    {if empty($sequence.note)}
                    <input type="hidden" name="notes[{$smarty.foreach.foo.index}][sequence][{$smarty.foreach.its.index}][sequence_id]" value="{$sequence.id}"  />
                    <select name="notes[{$smarty.foreach.foo.index}][sequence][{$smarty.foreach.its.index}][note]">
                        <option></option>
                        {for $it=1 to $ECHELLE}
                        <option value="{$it}">{$it}</option>
                        {/for}
                    </select>
                    {else}
                    {$sequence.note}
                    {/if}
                </td>
                {/foreach}
            </tr>
            {/foreach}
        </tbody>
    </table>
    <div class="center">
        <input type="submit" value="{$lang.Enregistrer}" />
    </div>
</form>