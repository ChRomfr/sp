<script type="text/javascript">
<!--
jQuery(document).ready(function(){
    // binds form submission and fields to the validation engine
    jQuery("#formEdit").validationEngine();
});
</script>

<div id="bread">
    <a href="{getLink("index/index")}" title="">{$lang.Accueil}</a>&nbsp;>>&nbsp;
    <a href="{getLink("administration/index")}" title="">{$lang.Administration}</a>&nbsp;>>&nbsp;
    <a href="{getLink("administration/organigrammeIndex")}" title="">{$lang.Organigramme}</a>&nbsp;>>&nbsp;
    {$lang.Edition}
</div>

<form class="form" action="{getLink("administration/organigrammeEdit")}" method="post" id="formEdit">
    <h1>{$lang.Edition}</h1>
	{if $config.multi_site == 1}
	<dl>
		<dt><label for="site_id">{$lang.Site}* :</label></dt>
		<dd>
			<select name="personne[site_id]" id="site_id" class="validate[required]">
				<option></option>
				{foreach $Sites as $Row}
				<option value="{$Row.id}" {if $Row.id == $Personne.site_id}selected="selected"{/if}>{$Row.nom}</option>
				{/foreach}
			</select>
		</dd>
	</dl>
	{/if}
    <dl>
        <dt><label for="nom">{$lang.Nom} :</label></dt>
        <dd><input type="text" name="personne[nom]" id="nom" required class="validate[required]" size="50" value="{$Personne.nom}"/></dd>
    </dl>
    <dl>
        <dt><label for="prenom">{$lang.Prenom} :</label></dt>
        <dd><input type="text" name="personne[prenom]" id="prenom" required class="validate[required]" size="50" value="{$Personne.prenom}"/></dd>
    </dl>
    <dl>
        <dt><label for="fonction">{$lang.Fonction} :</label></dt>
        <dd>
            <select name="personne[fonction]" id="fonction" class="validate[required]" required>
                <option></option>
                {foreach $PORG as $Row}
                <option value="{$Row.value}" {if $Row.value == $Personne.fonction}selected="selected"{/if}>{$Row.libelle}</option>
                {/foreach}
            </select>
        </dd>
    </dl>
    <dl>
        <dt><label for="email">{$lang.Email} :</label></dt>
        <dd><input type="email" size="50" name="personne[email]" class="validate[custom[email]]" id="email" value="{$Personne.email}"/></dd>
    </dl>
    <dl>
        <dt><label for="telephone">{$lang.Telephone} :</label></dt>
        <dd><input type="text" name="personne[telephone]" id="telephone" size="15" value="{$Personne.telephone}"/></dd>
    </dl>
    <div class="center">
        <input type="hidden" name="personne[creat_by]" value="{$Personne.creat_by}" />
        <input type="hidden" name="personne[edit_by]" value="{$smarty.session.utilisateur.id}" />
        <input type="hidden" name="personne[creat_on]" value="{$Personne.creat_on}"/>
        <input type="hidden" name="personne[edit_on]" value="{$smarty.now}" />
        <input type="hidden" name="personne[id]" value="{$Personne.id}" />
        <input type="submit" value="{$lang.Enregistrer}" />
    </div>
</form>