<script type="text/javascript">
function checkFormEditParent(){
    var error = 0;
    
    if( $("#type").val() == ""){
        $("#type").css("border-color","red");
        error++;
    }

    if( error > 0){
        return false;
    }else{
        return true;
    }
}

jQuery(document).ready(function(){
    // binds form submission and fields to the validation engine
    jQuery("#formEditParent").validationEngine();
});
</script>{strip}

<form method="post" action="{getLink("paren/edit")}" id="formEditParent" onsubmit="return checkFormEditParent()" class="form">
<dl>
    <dt><label for="type">{$lang.Type} :</label></dt>
    <dd>
        <select name="parent[type]" class="validate[required]" id="type">
            <option></option>
            <option value="m" {if $parent->type == "m"}selected="selected"{/if}>{$lang.Mere}</option>
            <option value="p" {if $parent->type == "p"}selected="selected"{/if}>{$lang.Pere}</option>
        </select>
    </dd>
</dl>
<dl>
    <dt><label for="parent1_nom">{$lang.Nom} :</label></dt>
    <dd><input type="text" name="parent[nom]" id="parent1_nom" class="validate[required]" value="{$parent->nom}"/></dd>
</dl>
<dl>
    <dt><label for="parent1_prenom">{$lang.Prenom} :</label></dt>
    <dd><input type="text" name="parent[prenom]" id="parent1_prenom" class="validate[required]" value="{$parent->prenom}"/></dd>
</dl>
<dl>
    <dt><label for="parent1_adresse">{$lang.Adresse} :</label></dt>
    <dd><textarea name="parent[adresse]" id="parent1_adresse" rows="3" cols="40">{$parent->adresse}</textarea></dd>
</dl>
<dl>
    <dt><label for="parent1_code_postal">{$lang.Code_postal} :</label></dt>
    <dd><input type="text" name="parent[code_postal]" id="parent1_code_postal" value="{$parent->code_postal}"/></dd>
</dl>
<dl>
    <dt><label for="parent1_ville">{$lang.Ville} :</label></dt>
    <dd><input type="text" name="parent[ville]" id="parent1_ville" value="{$parent->ville}"/></dd>
</dl>
<dl>
    <dt><label for="parent1_telephone">{$lang.Telephone} :</label></dt>
    <dd><input type="text" name="parent[telephone]" id="parent1_telephone" value="{$parent->telephone}" /></dd>
</dl>
<dl>
    <dt><label for="parent1_portable">{$lang.Portable} :</label></dt>
    <dd><input type="text" name="parent[portable]" id="parent1_portable" value="{$parent->portable}"/></dd>
</dl>
<dl>
    <dt><label for="parent1_emploi">{$lang.Profession} :</label></dt>
    <dd><input type="text" name="parent[emploi]" id="parent1_profession" value="{$parent->emploi}" /></dd>
</dl>
<dl>
    <dt><label for="parent1_telephone_pro">{$lang.Telephone} pro :</label></dt>
    <dd><input type="text" name="parent[telephone_pro]" id="parent1_telephone_pro" value="{$parent->telephone_pro}"/></dd>
</dl>
<div class="form_submit center">
    <input type="hidden" name="parent[joueur_id]" id="joueur_id" value="{$parent->joueur_id}" />
    <input type="hidden" name="parent[id]" value="{$parent->id}" />
    <input type="submit" value="{$lang.Enregistrer}" />    
</div>
</form>{/strip}