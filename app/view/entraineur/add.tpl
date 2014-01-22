{if !isset($smarty.get.nohtml)}
<div id="bread">
    <a href="{getLink("index/index")}" title="">{$lang.Accueil}</a>&nbsp;>>&nbsp;
    <a href="{getLink("entraineur/index")}" title="">{$lang.Entraineur}</a>&nbsp;>>&nbsp;
    {$lang.Nouveau}
</div>
{/if}

<form class="form" method="post" action="{getLink("entraineur/add")}">
	{if !isset($smarty.get.nohtml)}<h1>{$lang.Entraineur}</h1>{/if}
	<dl>
		<dt><label for="entraineur_nom">{$lang.Nom}</label></dt>
		<dd><input type="text" name="Entraineur[nom]" id="entraineur_nom" value="" size="50" required /></dd>
	</dl>
	<dl>
		<dt><label for="entraineur_prenom">{$lang.Prenom}</label></dt>
		<dd><input type="text" name="Entraineur[prenom]" id="entraineur_prenom" value="" size="50" required /></dd>
	</dl>
	<dl>
		<dt><label for="entraineur_telephone">{$lang.Telephone} :</label></dt>
		<dd><input type="text" name="Entraineur[telephone]" id="entraineur_telephone" value="" required /></dd>
	</dl>
    <dl>
        <dt><label for="entrainteur_email">{$lang.Email} :</label></dt>
        <dd><input type="email" id="entraineur_email" name="Entraineur[email]" size="50" required class="validate[custom[email]]" /></dd>
    </dl>
    <dl>
        <dt><label for="structure_id">{$lang.Structure} :</label></dt>
        <dd>
            <select name="Entraineur[structure_id]" id="structure_id">
                <option></option>
                {foreach $Structures as $Row}
                <option value="{$Row.id}">{$Row.nom}</option>
                {/foreach}
            </select>
        </dd>
    </dl>
	<div class="center">
		<input type="submit" value="{$lang.Enregistrer}" />
	</div>
</form>