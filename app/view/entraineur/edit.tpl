<div id="bread">
    <a href="{getLink("index/index")}" title="">{$lang.Accueil}</a>&nbsp;>>&nbsp;
    <a href="{getLink("entraineur/index")}" title="">{$lang.Entraineur}</a>&nbsp;>>&nbsp;
    {$lang.Edition}
</div>

<form class="form" method="post">
	<h1>{$lang.Entraineur}</h1>
	<dl>
		<dt><label for="entraineur_nom">{$lang.Nom}</label></dt>
		<dd><input type="text" name="Entraineur[nom]" id="entraineur_nom" value="{$Entraineur->nom}" size="50" required /></dd>
	</dl>
	<dl>
		<dt><label for="entraineur_prenom">{$lang.Prenom}</label></dt>
		<dd><input type="text" name="Entraineur[prenom]" id="entraineur_prenom" value="{$Entraineur->prenom}" size="50" required /></dd>
	</dl>
	<dl>
		<dt><label for="entraineur_telephone">{$lang.Telephone} :</label></dt>
		<dd><input type="text" name="Entraineur[telephone]" id="entraineur_telephone" value="{$Entraineur->telephone}" required/></dd>
	</dl>
    <dl>
        <dt><label for="entrainteur_email">{$lang.Email} :</label></dt>
        <dd><input type="email" id="entraineur_email" name="Entraineur[email]" size="50" required class="validate[custom[email]]" value="{$Entraineur->email}"/></dd>
    </dl>
    <dl>
        <dt><label for="structure_id">{$lang.Structure} :</label></dt>
        <dd>
            <select name="Entraineur[structure_id]" id="structure_id">
                <option></option>
                {foreach $Structures as $Row}
                <option value="{$Row.id}" {if $Row.id == $Entraineur->structure_id}selected="selected"{/if}>{$Row.nom}</option>
                {/foreach}
            </select>
        </dd>
    </dl>
	<div class="center">
		<input type="hidden" name="Entraineur[id]" value="{$Entraineur->id}" />
		<input type="submit" value="{$lang.Enregistrer}" />
	</div>
</form>