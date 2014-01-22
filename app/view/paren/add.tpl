<script type="text/javascript">
function checkFormAddParent(){
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
    jQuery("#formAddParent").validationEngine();
});
</script>{strip}

<form method="post" action="{getLink("paren/add")}" id="formAddParent" onsubmit="return checkFormAddParent()" class="form">
<dl>
    <dt><label for="type">{$lang.Type} :</label></dt>
    <dd>
        <select name="parent[type]" class="validate[required]" id="type">
            <option></option>
            <option value="m">{$lang.Mere}</option>
            <option value="p">{$lang.Pere}</option>
        </select>
    </dd>
</dl>
<dl>
    <dt><label for="parent1_nom">{$lang.Nom} :</label></dt>
    <dd><input type="text" name="parent[nom]" id="parent1_nom" class="validate[required]"/></dd>
</dl>
<dl>
    <dt><label for="parent1_prenom">{$lang.Prenom} :</label></dt>
    <dd><input type="text" name="parent[prenom]" id="parent1_prenom" class="validate[required]" /></dd>
</dl>
<dl>
    <dt><label for="parent1_adresse">{$lang.Adresse} :</label></dt>
    <dd><textarea name="parent[adresse]" id="parent1_adresse" rows="3" cols="40"></textarea></dd>
</dl>
<dl>
    <dt><label for="parent1_code_postal">{$lang.Code_postal} :</label></dt>
    <dd><input type="text" name="parent[code_postal]" id="parent1_code_postal" /></dd>
</dl>
<dl>
    <dt><label for="parent1_ville">{$lang.Ville} :</label></dt>
    <dd><input type="text" name="parent[ville]" id="parent1_ville" /></dd>
</dl>
<dl>
    <dt><label for="parent1_telephone">{$lang.Telephone} :</label></dt>
    <dd><input type="text" name="parent[telephone]" id="parent1_telephone" /></dd>
</dl>
<dl>
    <dt><label for="parent1_portable">{$lang.Portable} :</label></dt>
    <dd><input type="text" name="parent[portable]" id="parent1_portable" /></dd>
</dl>
<dl>
    <dt><label for="parent1_emploi">{$lang.Profession} :</label></dt>
    <dd><input type="text" name="parent[emploi]" id="parent1_profession" /></dd>
</dl>
<dl>
    <dt><label for="parent1_telephone_pro">{$lang.Telephone} pro :</label></dt>
    <dd><input type="text" name="parent[telephone_pro]" id="parent1_telephone_pro" /></dd>
</dl>
<div class="form_submit center">
    <input type="hidden" name="parent[joueur_id]" id="joueur_id" value="{$joueur_id}" />
    <input type="submit" value="{$lang.Enregistrer}" />    
</div>
</form>{/strip}