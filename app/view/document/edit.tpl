<div id="bread">
    <a href="{getLink("index/index")}" title="">{$lang.Accueil}</a>&nbsp;>>&nbsp;
    <a href="{getLink("document/index")}" title="">{$lang.Documents}</a>&nbsp;>>&nbsp;
    {$lang.Edition}
</div>
<form method="post" action="" enctype="multipart/form-data" class="form">
   <!-- <dl>
        <dt><label for="fichier">{$lang.Fichier} :</label></dt>
        <dd><input type="file" name="doc" /></dd>
    </dl> -->
    <dl>
        <dt><label>{$lang.Nom} :</label></dt>
        <dd><input type="text" name="fichier[nom]" id="fichier_nom" class="validate[required]" value="{$Fichier.nom}"/></dd>
    </dl>
    <dl>
        <dt><label>{$lang.Description} :</label></dt>
        <dd><textarea name="fichier[description]" rows="2" cols="40">{$Fichier.description}</textarea></dd>
    </dl>
    
    <!-- Listing des utilisateurs pour attribution des droits -->
    <dl>
        <dt><label for="utilisateurs">{$lang.Utilisateurs} :</label></dt>
        <dd>
            {foreach $Utilisateurs as $Utilisateur name=lusers}
            <input type="checkbox" name="users[{$smarty.foreach.lusers.index}]" value="{$Utilisateur.id}"
            {foreach $UserInAcl as $Row}
                {if $Row.user_id == $Utilisateur.id}checked="checked"{/if}
            {/foreach}
            />{$Utilisateur.identifiant}<br/>
            {/foreach}
        </dd>
    </dl>
    
    <div class="center">
        <input type="hidden" name="token" value="{$smarty.session.token}" />
        <input type="hidden" name="fichier[id]" value="{$Fichier.id}" />
        <input type="submit" value="{$lang.Enregistrer}" />
    </div>
</form>