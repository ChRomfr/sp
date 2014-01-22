<ul class="breadcrumb">
    <li><a href="{getLink("index")}" title="">{$lang.Accueil}</a><span class="divider">/</span></li>
    <li><a href="{getLink("administration")}" title="">{$lang.Administration}</a><span class="divider">/</span></li>
    <li><a href="{getLink("administration/organigrammeIndex")}" title="">{$lang.Organigramme}</a><span class="divider">/</span></li>
    <li>{$lang.Nouveau}</li>
</ul>

<form class="form well" action="{getLink("administration/organigrammeAdd")}" method="post" id="formAdd">
    <h1>{$lang.Nouveau}</h1>
	{if $config.multi_site == 1}
	<dl>
		<dt><label for="site_id">{$lang.Site}* :</label></dt>
		<dd>
			<select name="personne[site_id]" id="site_id" class="validate[required]">
				<option></option>
				{foreach $Sites as $Row}
				<option value="{$Row.id}">{$Row.nom}</option>
				{/foreach}
			</select>
		</dd>
	</dl>
	{/if}
    <dl>
        <dt><label for="nom">{$lang.Nom} :</label></dt>
        <dd><input type="text" name="personne[nom]" id="nom" required class="validate[required]" size="50" /></dd>
    </dl>
    <dl>
        <dt><label for="prenom">{$lang.Prenom} :</label></dt>
        <dd><input type="text" name="personne[prenom]" id="prenom" required class="validate[required]" size="50" /></dd>
    </dl>
    <dl>
        <dt><label for="fonction">{$lang.Fonction} :</label></dt>
        <dd>
            <select name="personne[fonction]" id="fonction" class="validate[required]" required>
                <option></option>
                {foreach $PORG as $Row}
                <option value="{$Row.value}">{$Row.libelle}</option>
                {/foreach}
            </select>
        </dd>
    </dl>
    <dl>
        <dt><label for="email">{$lang.Email} :</label></dt>
        <dd><input type="email" size="50" name="personne[email]" class="validate[custom[email]]" id="email"/></dd>
    </dl>
    <dl>
        <dt><label for="telephone">{$lang.Telephone} :</label></dt>
        <dd><input type="text" name="personne[telephone]" id="telephone" size="15" /></dd>
    </dl>
    <div class="center">
        <input type="hidden" name="personne[creat_by]" value="{$smarty.session.utilisateur.id}" />
        <input type="hidden" name="personne[edit_by]" value="{$smarty.session.utilisateur.id}" />
        <input type="hidden" name="personne[creat_on]" value="{$smarty.now}" />
        <input type="hidden" name="personne[edit_on]" value="{$smarty.now}" />
        <input type="submit" value="{$lang.Enregistrer}" />
    </div>
</form>

<script type="text/javascript">
<!--
jQuery(document).ready(function(){
    // binds form submission and fields to the validation engine
    jQuery("#formAdd").validationEngine();
});
</script>