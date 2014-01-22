<script type="text/javascript">
<!--
function checkSubmitFormComm(){
    if( $("#commentaire").val() == ""){
        return false;
    }else{
        return true;
    }
}
//-->
</script>
<table class="tadmin">
    <tr>
        <th>{$lang.Type}</th>
        <td>{$Suivi.type}</td>
    </tr>
    <tr>
        <th>{$lang.Suivi}</th>
        <td>{$Suivi.suivi|nl2br}</td>
    </tr>
    {if isset($smarty.session.utilisateur.suivi_medical_show_prive) && $smarty.session.utilisateur.suivi_medical_show_prive == 1}
     <tr>
        <th>{$lang.Suivi_prive}</th>
        <td>{$Suivi.suivi_prive|nl2br}</td>
    </tr>
    {/if}
    <tr>
        <th>{$lang.Arret_rugby}</th>
        <td>
            {if $Suivi.dispo_rugby == 0}
                {$lang.Non}
            {else}
                {if $Suivi.dispo_rugby > time()}
                    <span style="color:red">{$Suivi.dispo_rugby|date_format:$config.format_date_day}</span>
                {else}
                    {$lang.Arret_fini}<small>({$Suivi.dispo_rugby|date_format:$config.format_date_day})</small>
                {/if}
            {/if}
        </td>
    </tr>
    <tr>
        <th>{$lang.Arret_musculation}</th>
        <td>{if $Suivi.dispo_muscu == 0}{$lang.Non}{else}{if $Suivi.dispo_muscu > time()}<span style="color:red">{$Suivi.dispo_muscu|date_format:$config.format_date_day}</span>{else}{$lang.Arret_fini}<small>({$Suivi.dispo_rugby|date_format:$config.format_date_day})</small>{/if}{/if}</td>
    </tr>
</table>

{* AFFICHAGE DES COMMENTAIRES *}
{if count($Commentaires) > 0}
    <h4>{$lang.Commentaires} :</h4>    
    {foreach $Commentaires as $Row}
    <table class="tadmin">
    <tr><td><div>{$Row.commentaire|nl2br}</div></td></tr>
    <tr><td><div>Par : {$Row.identifiant}, Le {$Row.date_saisie|date_format:$config.format_date_day}</div></td></tr>
    </table>
    <div class="sep"></div>
    {/foreach}    
{/if}

{* FORMULAIRE AJOUT COMMENTAIRE *}
{if $smarty.session.acl.gest_suivimed == 1}
{if count($Commentaires)==0}<div class="sep"></div>{/if}
<form method="post" action="{getLink("suiviMedical/addCommentaire/{$Suivi.id}")}" onsubmit="return checkSubmitFormComm();">
    <dl>
        <dt>{$lang.Commentaire}</dt>
        <dd><textarea cols="30" rows="3" id="commentaire" name="commentaire[commentaire]"></textarea></dd>
    </dl>
    <div class="form_submit center">
        <input type="hidden" name="commentaire[suivi_id]" value="{$Suivi.id}" />
        <input type="hidden" name="joueur_id" value="{$Suivi.joueur_id}" />
        <input type="submit" value="{$lang.Enregistrer}" />
    </div>
</form>
{/if}